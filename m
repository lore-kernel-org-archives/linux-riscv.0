From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Wed, 7 Nov 2018 19:25:55 +0100
Subject: warning in ./arch/riscv/include/asm/module.h
In-Reply-To: <CAK8P3a3KgBq72763QQauKNWdSv9ZRRUWMDxt1RycV6RxAJsCng@mail.gmail.com>
References: <CAEn-LToUoaA0H=_boLUi6SPXyo5Wfge293GbOhgxw2-JcZDKmg@mail.gmail.com>
 <CAK8P3a3KgBq72763QQauKNWdSv9ZRRUWMDxt1RycV6RxAJsCng@mail.gmail.com>
Message-ID: <CAEn-LTr__59kApb=kkm7aH0z4w-J9xG1rzhK1xDk3xCGSis9SQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 5, 2018 at 10:02 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On 11/5/18, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> > Hi,
> >
> > This happens once you enable "Module signature verification". E.g.,
> >
> > [..]
> > CONFIG_MODULE_SIG=y
> > CONFIG_MODULE_SIG_ALL=y
> > CONFIG_MODULE_SIG_SHA256=y
> > CONFIG_MODULE_SIG_HASH="sha256"
> > CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
> > [..]
> >
> > BUILDSTDERR: In file included from kernel/module-internal.h:13,
> > BUILDSTDERR:                  from kernel/module_signing.c:17:
> > BUILDSTDERR: ./arch/riscv/include/asm/module.h:11:34: warning: 'struct
> > module' declared inside parameter list will not be visible outside of
> > this definition or declaration
> > BUILDSTDERR:  u64 module_emit_got_entry(struct module *mod, u64 val);
> > BUILDSTDERR:                                   ^~~~~~
> > BUILDSTDERR: ./arch/riscv/include/asm/module.h:12:34: warning: 'struct
> > module' declared inside parameter list will not be visible outside of
> > this definition or declaration
> > BUILDSTDERR:  u64 module_emit_plt_entry(struct module *mod, u64 val);
> > BUILDSTDERR:                                   ^~~~~~
>
> This is very easy to fix:
>
> diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
> index 349df33808c4..cd2af4b013e3 100644
> --- a/arch/riscv/include/asm/module.h
> +++ b/arch/riscv/include/asm/module.h
> @@ -8,6 +8,7 @@
>
>  #define MODULE_ARCH_VERMAGIC    "riscv"
>
> +struct module;
>  u64 module_emit_got_entry(struct module *mod, u64 val);
>  u64 module_emit_plt_entry(struct module *mod, u64 val);
>

True. Originally I was wondering if there is a bigger problem with
header ordering. I will send the patch.

> > BUILDSTDERR: net/core/rtnetlink.c: In function 'rtnl_newlink':
> > BUILDSTDERR: net/core/rtnetlink.c:3224:1: warning: the frame size of
> > 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> > BUILDSTDERR:  }
> > BUILDSTDERR:  ^
>
> This may be much harder. I've fixed this type of issue for arm and
> x86, but it requires a much more detailed analysis of what's going
> on. This is often a compiler bug. Which compiler version are you
> using?

Ops. I didn't indent to copy this one. This one is expected as Fedora
has CONFIG_FRAME_WARN set to 1024. Only couple architectures
set that to higher number (2048).

david

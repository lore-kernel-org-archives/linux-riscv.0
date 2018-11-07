From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 7 Nov 2018 22:12:09 +0100
Subject: warning in ./arch/riscv/include/asm/module.h
In-Reply-To: <CAEn-LTr__59kApb=kkm7aH0z4w-J9xG1rzhK1xDk3xCGSis9SQ@mail.gmail.com>
References: <CAEn-LToUoaA0H=_boLUi6SPXyo5Wfge293GbOhgxw2-JcZDKmg@mail.gmail.com>
 <CAK8P3a3KgBq72763QQauKNWdSv9ZRRUWMDxt1RycV6RxAJsCng@mail.gmail.com>
 <CAEn-LTr__59kApb=kkm7aH0z4w-J9xG1rzhK1xDk3xCGSis9SQ@mail.gmail.com>
Message-ID: <CAK8P3a1hXOkL69qyu6PP3KM=ax1kVUtm5QQn1+xoExjONC_1fQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Nov 7, 2018 at 7:26 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> On Mon, Nov 5, 2018 at 10:02 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On 11/5/18, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> > > BUILDSTDERR: net/core/rtnetlink.c: In function 'rtnl_newlink':
> > > BUILDSTDERR: net/core/rtnetlink.c:3224:1: warning: the frame size of
> > > 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> > > BUILDSTDERR:  }
> > > BUILDSTDERR:  ^
> >
> > This may be much harder. I've fixed this type of issue for arm and
> > x86, but it requires a much more detailed analysis of what's going
> > on. This is often a compiler bug. Which compiler version are you
> > using?
>
> Ops. I didn't indent to copy this one. This one is expected as Fedora
> has CONFIG_FRAME_WARN set to 1024. Only couple architectures
> set that to higher number (2048).

Om 64-bit architectures, setting it to 1024 causes lots of extra
warnings, since we have certain functions that put an array of
128 pointers on the stack. The default value in the kernel is 2048,
but I've managed to reduce it to 1280 in the past. I never managed
to get all the patches for that included, but I think that would be
a useful number if Fedora really wants to have something lower
than the default (and then fix the outliers).

       Arnd

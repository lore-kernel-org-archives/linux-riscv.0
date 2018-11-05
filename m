From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon, 5 Nov 2018 15:51:04 +0100
Subject: warning in ./arch/riscv/include/asm/module.h
Message-ID: <CAEn-LToUoaA0H=_boLUi6SPXyo5Wfge293GbOhgxw2-JcZDKmg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,

This happens once you enable "Module signature verification". E.g.,

[..]
CONFIG_MODULE_SIG=y
CONFIG_MODULE_SIG_ALL=y
CONFIG_MODULE_SIG_SHA256=y
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
[..]

BUILDSTDERR: In file included from kernel/module-internal.h:13,
BUILDSTDERR:                  from kernel/module_signing.c:17:
BUILDSTDERR: ./arch/riscv/include/asm/module.h:11:34: warning: 'struct
module' declared inside parameter list will not be visible outside of
this definition or declaration
BUILDSTDERR:  u64 module_emit_got_entry(struct module *mod, u64 val);
BUILDSTDERR:                                   ^~~~~~
BUILDSTDERR: ./arch/riscv/include/asm/module.h:12:34: warning: 'struct
module' declared inside parameter list will not be visible outside of
this definition or declaration
BUILDSTDERR:  u64 module_emit_plt_entry(struct module *mod, u64 val);
BUILDSTDERR:                                   ^~~~~~
BUILDSTDERR: net/core/rtnetlink.c: In function 'rtnl_newlink':
BUILDSTDERR: net/core/rtnetlink.c:3224:1: warning: the frame size of
1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
BUILDSTDERR:  }
BUILDSTDERR:  ^

From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 26 Feb 2018 17:28:52 -0800 (PST)
Subject: RISC-V Seccomp Support?
In-Reply-To: <87bmgc4co3.fsf@xps13.shealevy.com>
Message-ID: <mhng-05569257-b64f-4bc4-b7ce-c86060a41e76@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sun, 25 Feb 2018 20:06:52 PST (-0800), shea at shealevy.com wrote:
> Is anyone actively working on CONFIG_HAVE_ARCH_SECCOMP_FILTER support
> for RISC-V? If not, any pointers to getting started on that?

IIRC, the filters for seccomp are based on some variant of BPF.  I bet the vast 
majority of the work here will be bringing up the BPF infrastructure for 
RISC-V.

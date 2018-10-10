From: thierry.reding@gmail.com (Thierry Reding)
Date: Wed, 10 Oct 2018 15:51:09 +0200
Subject: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
In-Reply-To: <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
Message-ID: <20181010135109.GE21134@ulmo>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
[...]
> +- interrupts: one interrupt per PWM channel (currently unused in the driver)

This should probably say what the interrupt is used for. And once you
have that, remove the comment about it being unused in the driver. DT
is OS agnostic, so "driver" is very unspecific and your claim may
actually be false.

Thierry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181010/0632c617/attachment.sig>

From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon, 5 Nov 2018 15:43:12 +0100
Subject: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
References: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
Message-ID: <CAEn-LTrK2x3n9enzv=+CbCOFzVrX_RZXZ1wB_ktjkys=wzYfLw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 5, 2018 at 3:26 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:

[..]
> diff --git a/arch/riscv/include/uapi/asm/syscalls.h b/arch/riscv/include/uapi/asm/unistd.h
> similarity index 54%
> rename from arch/riscv/include/uapi/asm/syscalls.h
> rename to arch/riscv/include/uapi/asm/unistd.h
> index 206dc4b0f6ea..5545f498071d 100644
[..]

I forgot to pass --no-renames to git format-patch.
If you want I can resend it with --no-renames to make it
a bit more readable.

david

From: olof@lixom.net (Olof Johansson)
Date: Wed, 31 Oct 2018 12:20:40 -0700
Subject: [PATCH] RISC-V: defconfig: Enable printk timestamps
In-Reply-To: <20181030123720.3273-1-anup@brainfault.org>
References: <20181030123720.3273-1-anup@brainfault.org>
Message-ID: <CAOesGMjXZNURZ4SdKjssYCcFv3=4MYLBpBpzvvb1rNM-fo=QHQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 30, 2018 at 5:37 AM Anup Patel <anup@brainfault.org> wrote:
>
> The printk timestamps are very useful information to visually see
> where kernel is spending time during boot. It also helps us see
> the timing of hotplug events at runtime.
>
> This patch enables printk timestamps in RISC-V defconfig so that
> we have it enabled by default (similar to other architectures
> such as x86_64, arm64, etc).
>
> Signed-off-by: Anup Patel <anup@brainfault.org>

Acked-by: Olof Johansson <olof@lixom.net>

For next time: doing a re-format of the defconfig (to shuffle config
order), plus changes in the same patch, tends to be a bit fragile. For
cases like these, I'd recommend hand-pruning to just flip the one
option if needed, and then have Palmer or Andrew refresh the defconfig
during a merge window if needed (usually quite rare).


-Olof

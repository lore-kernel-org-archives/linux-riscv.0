From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 20 Nov 2018 09:29:48 -0800 (PST)
Subject: Kernel panic - not syncing: corrupted stack end detected inside
 scheduler
In-Reply-To: <mvmftvw9llx.fsf@suse.de>
Message-ID: <mhng-a200fe90-01a6-444d-9f76-0b00c22249e8@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 20 Nov 2018 00:52:42 PST (-0800), schwab at suse.de wrote:
> On Nov 19 2018, Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> Sorry I can't be more specific.  Does this require hardware to manifest?
>
> This was on the hifive.

OK, well, we know there are at least some issues when using an SD card via the 
SPI interface as a disk, but nobody has had time to track it down yet.  Right 
now the only reproducer is to just write a lot of data, which is a pain to 
debug.  The current issue manifests as a hang in some kernel thread that has a 
MMC-like name.  What you're seeing may be the same or a different issue.

Do you have a better way to reproduce this than to just hammer the filesystem?

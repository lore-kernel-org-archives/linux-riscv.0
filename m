From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 15 Oct 2018 17:40:13 -0700 (PDT)
Subject: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for vda
 device
In-Reply-To: <20181015211451.GC31130@redhat.com>
Message-ID: <mhng-2be13863-3f80-432c-9945-2770e7e7e4b4@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 15 Oct 2018 14:14:51 PDT (-0700), rjones at redhat.com wrote:
> On Tue, Oct 16, 2018 at 09:26:20AM +1300, 'Michael Clark' via RISC-V SW Dev wrote:
>> Dropping isa-dev, adding sw-dev
>>
>> > On 16/10/2018, at 3:00 AM, Pintu Kumar <pintu.ping@gmail.com> wrote:
>> >
>> > Hi,
>> > I am trying to setup riscv-qemu booting on a new Ubuntu PC.
>> > I dont want to use freedom-u-sdk, so I am preparing my own environment.
>> > I could able to build the following:
>> > - riscv-toolchain
>> > - riscv-linux
>> > - riscv-qemu
>> > - riscv-pk
>> > - busybear
>> >
>> > After that, I am trying to boot riscv-qemu, using the following command:
>> > # sudo qemu-system-riscv64 -nographic -machine virt -kernel
>> > PK/riscv-pk/build/bbl -append "root=/dev/vda ro console=ttyS0" -drive
>> > file=busybear.bin,format=raw,id=hd0 -device
>> > virtio-blk-device,drive=hd0
>>
>> Note: sudo is not required. sudo is used in the busybear start-qemu.sh script as it uses bridged networking. The latest version of busybear points at linux-4.19-rc5 so the issue may have been fixed.
>>
>> > But, I am getting kernel panic.
>> >
>> > ---------
>> > bbl loader
>> > ....
>> > Linux version 4.18.0-rc6...
>
> It's a bit of a guess, but could this be the upstream kernel?  The
> latest riscv-linux is 4.18.0 (not -rc6).
>
> The reason I say it might be the upstream kernel is because ...
>
>> > virtio_blk: probe of virtio0 failed with error -22
>
> ... I saw this exact error when I was using the upstream kernel
> instead of the one which supported interrupt handling.  Interrupt
> handling for RISC-V was added upstream after 4.18 so wouldn't be
> included in upstream 4.18.0-rc6.

Your best bet today is to run 4.19-rc8, which should be pretty stable.

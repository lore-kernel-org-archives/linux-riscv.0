From: michaeljclark@mac.com (Michael Clark)
Date: Wed, 17 Oct 2018 11:30:50 +1300
Subject: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for vda
 device
In-Reply-To: <20181016200245.j2gesmdjgoi7zmqh@excalibur.cnev.de>
References: <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
 <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
 <20181016200245.j2gesmdjgoi7zmqh@excalibur.cnev.de>
Message-ID: <D9003246-0336-4327-97D3-D8F079F640D3@mac.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org



> On 17/10/2018, at 9:02 AM, Karsten Merker <merker@debian.org> wrote:
> 
>> On Tue, Oct 16, 2018 at 11:38:53AM -0700, Palmer Dabbelt wrote:
>>> On Tue, 16 Oct 2018 06:12:11 PDT (-0700), pintu.ping at gmail.com wrote:
>>>> On Tue, Oct 16, 2018 at 6:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>>> On Mon, 15 Oct 2018 14:14:51 PDT (-0700), rjones at redhat.com wrote:
> [...]
>>>> Your best bet today is to run 4.19-rc8, which should be pretty stable.
>>> 
>>> Yes, I checked with mainline linux-kernel 4.19.
>>> Now I am able to boot successfully and login into qemu-riscv shell.
>>> Thank you so much :)
>>> 
>>> But I am curious to know what changes resulted into this fix, in 4.19 kernel ?
>>> Which is the exact patch in mainline, that fixes this issue?
>>> Because at times during the development, it will be difficult to
>>> simply upgrade the kernel version.
>> 
>> Yes, that's expected.  RISC-V Linux is still pretty bleeding edge, you just
>> happened to catch it between when master started working and when there was
>> a proper release that contained your patches.  Since master is very calm
>> right now (there was an rc8 before release, but it's very close to a
>> release) it's OK to use, but you best bet going forward is to use the
>> release tarballs just like normal.
> 
> Just as a data point in case you should find it helpful: I'm
> since two weeks running 4.19-rc6/-rc7 on the qemu-riscv "virt"
> board under permanent heavy load (the system is running a Debian
> package builder) without a single hiccup.

Hi Karsten,

Have you tried riscv-qemu? I know qemu-riscv gets quite a lot of testing but I?d like to gain some more confidence in riscv-qemu.

We might have a PLIC bug in QEMU. If anyone has a reproducer they can file an issue on the riscv-qemu issue tracker and I?ll take a look...

Michael

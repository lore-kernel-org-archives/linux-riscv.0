From: rjones@redhat.com (Richard W.M. Jones)
Date: Thu, 1 Nov 2018 09:46:09 +0000
Subject: SBI extension proposal
In-Reply-To: <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
Message-ID: <20181101094609.GE27120@redhat.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Nov 01, 2018 at 03:05:51PM +0530, Anup Patel wrote:
> On Thu, Nov 1, 2018 at 2:50 PM Philipp Hug <philipp@hug.cx> wrote:
> >
> > Hi Atish,
> >
> > Am Mi., 31. Okt. 2018 um 19:24 Uhr schrieb Atish Patra <atish.patra@wdc.com>:
> >>
> >> -- u32 sbi_get_version(void):
> >> -- u32 sbi_check_api(unsigned long start_api_id, unsigned long count):
> >
> >
> > How about putting the version information into device tree and use the compatible string? This seems more reliable than probing.
> > e.g.
> > firmware {
> >         sbi {
> >                 compatible = "riscv,sbi-r0p1", "riscv,sbi-r0p2";
> >         };
> > };
> 
> If it was just DT then I think having this information in DT makes
> sense. In future,
> we might definitely see some ACPI support in RISC-V too (just like ARM64 world).

I agree.  Please try not to make things that depend on DT, as it's a
Linux-only description which isn't suitable for other OSes and has a
poorly defined ABI.

Rich.

> Of course, we cannot keep adding new SBI calls for static information but we can
> certainly have bare-minimum mandatory SBI calls for version and capabilities.
> 
> >
> > You could also add more information about the supported features to this sbi node.
> >
> > I'd also suggest that all functions can return an error code and are not of type void.
> 
> Yes, I agree. With SBI v0.2, existing SBI calls from v0.1 should
> return error code.
> 
> Regards,
> Anup

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

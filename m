From: rjones@redhat.com (Richard W.M. Jones)
Date: Thu, 1 Nov 2018 11:25:28 +0000
Subject: SBI extension proposal
In-Reply-To: <CA+h06zjY86e5UHa9HzSFvKNkT_oMz7sQWkBQY8ufg6x25CmsKQ@mail.gmail.com>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
 <20181101094609.GE27120@redhat.com>
 <CA+h06zjY86e5UHa9HzSFvKNkT_oMz7sQWkBQY8ufg6x25CmsKQ@mail.gmail.com>
Message-ID: <20181101112528.GH27120@redhat.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Nov 01, 2018 at 12:03:49PM +0100, Philipp Hug wrote:
> Am Do., 1. Nov. 2018 um 10:46 Uhr schrieb Richard W.M. Jones
> <rjones@redhat.com>:
> >
> > I agree.  Please try not to make things that depend on DT, as it's a
> > Linux-only description which isn't suitable for other OSes and has a
> > poorly defined ABI.
> >
> You don't have to depend on DT. If you implement ACPI you'd put this
> information in ACPI as well as you do with other information about the
> platform.
> What's the advantage of putting static information into an SBI call
> instead of putting it in DT, ACPI, ...?

You only have to put it in one place.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

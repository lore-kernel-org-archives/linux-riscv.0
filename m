From: philipp@hug.cx (Philipp Hug)
Date: Thu, 1 Nov 2018 12:03:49 +0100
Subject: SBI extension proposal
In-Reply-To: <20181101094609.GE27120@redhat.com>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
 <20181101094609.GE27120@redhat.com>
Message-ID: <CA+h06zjY86e5UHa9HzSFvKNkT_oMz7sQWkBQY8ufg6x25CmsKQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Am Do., 1. Nov. 2018 um 10:46 Uhr schrieb Richard W.M. Jones
<rjones@redhat.com>:
>
> I agree.  Please try not to make things that depend on DT, as it's a
> Linux-only description which isn't suitable for other OSes and has a
> poorly defined ABI.
>
You don't have to depend on DT. If you implement ACPI you'd put this
information in ACPI as well as you do with other information about the
platform.
What's the advantage of putting static information into an SBI call
instead of putting it in DT, ACPI, ...?

Philipp

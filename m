From: olof@lixom.net (Olof Johansson)
Date: Thu, 1 Nov 2018 20:17:09 -0700
Subject: SBI extension proposal
In-Reply-To: <7c20c4d5-1726-d940-58ef-6541f0a117d2@wdc.com>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
 <20181101094609.GE27120@redhat.com>
 <CA+h06zjY86e5UHa9HzSFvKNkT_oMz7sQWkBQY8ufg6x25CmsKQ@mail.gmail.com>
 <20181101112528.GH27120@redhat.com>
 <7c20c4d5-1726-d940-58ef-6541f0a117d2@wdc.com>
Message-ID: <CAOesGMiRW=CHy7i3xWgEk2Oq8BGxRwd2Mvt8DWt96XNqBFB1HA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Nov 1, 2018 at 8:10 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 11/1/18 4:25 AM, Richard W.M. Jones wrote:
> > On Thu, Nov 01, 2018 at 12:03:49PM +0100, Philipp Hug wrote:
> >> Am Do., 1. Nov. 2018 um 10:46 Uhr schrieb Richard W.M. Jones
> >> <rjones@redhat.com>:
> >>>
> >>> I agree.  Please try not to make things that depend on DT, as it's a
> >>> Linux-only description which isn't suitable for other OSes and has a
> >>> poorly defined ABI.
> >>>
> >> You don't have to depend on DT. If you implement ACPI you'd put this
> >> information in ACPI as well as you do with other information about the
> >> platform.
> >> What's the advantage of putting static information into an SBI call
> >> instead of putting it in DT, ACPI, ...?
> >
> > You only have to put it in one place.
> >
> > Rich.
> >
> I agree with Richard. It is better to manage it in SBI implementation.
> This version will not change in every kernel release or so. I think
> having global SBI version in SBI spec is fine.
>
> However, we may need to put <function,version> for vendor specific APIs
> in DT/ACPI as pointed by olof earlier. That will help to avoid conflicts.
>
> I will update the proposal such that it is clear that we are not making
> DT mandatory, ACPI is an option as well. SBI spec should independent of
> OS specific spec.

Please keep the ACPI mess out of it for now, there is no reason to go there.


-Olof

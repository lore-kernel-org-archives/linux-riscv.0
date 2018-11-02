From: sudeep.holla@arm.com (Sudeep Holla)
Date: Fri, 2 Nov 2018 13:31:00 +0000
Subject: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
In-Reply-To: <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
 <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
Message-ID: <20181102133100.GA13130@e107155-lin>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Nov 02, 2018 at 08:09:39AM -0500, Rob Herring wrote:
> On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
> > But it doesn't need a separate thread node for defining SMT systems.
> > Multiple cpu phandle properties can be parsed to identify the sibling
> > hardware threads. Moreover, we do not have cluster concept in RISC-V.
> > So package is a better word choice than cluster for RISC-V.
>
> There was a proposal to add package info for ARM recently. Not sure
> what happened to that, but we don't need 2 different ways.
>

We still need that, I can brush it up and post what Lorenzo had previously
proposed[1]. We want to keep both DT and ACPI CPU topology story aligned.

--
Regards,
Sudeep

[1] https://marc.info/?l=devicetree&m=151817774202854&w=2

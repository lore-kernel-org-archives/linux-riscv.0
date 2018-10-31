From: anup@brainfault.org (Anup Patel)
Date: Wed, 31 Oct 2018 16:46:10 +0530
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
References: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
Message-ID: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 31, 2018 at 4:06 PM Vincent Chen <vincentc@andestech.com> wrote:
>
>   RISC-V permits each vendor to develop respective extension ISA based
> on RISC-V standard ISA. This means that these vendor-specific features
> may be compatible to their compiler and CPU. Therefore, each vendor may
> be considered a sub-architecture of RISC-V. Currently, vendors do not
> have the appropriate examples to add these specific features to the
> kernel. In this RFC set, we propose an infrastructure that vendor can
> easily hook their specific features into kernel. The first commit is
> the main body of this infrastructure. In the second commit, we provide
> a solution that allows dma_map_ops() to work without cache coherent
> agent support. Cache coherent agent is unsupported for low-end CPUs in
> the AndeStar RISC-V series. In order for Linux to run on these CPUs, we
> need this solution to overcome the limitation of cache coherent agent
> support. Hence, it also can be used as an example for the first commit.
>
>   I am glad to discuss any ideas, so if you have any idea, please give
> me some feedback.
>

I agree that we need a place for vendor-specific ISA extensions and
having vendor-specific directories is also good.

What I don't support is the approach of having compile time selection
of vendor-specific ISA extension.

We should have runtime probing for compatible vendor-specific ISA
extension. Also, it should be possible to link multiple vendor-specific
SA extensions to same kernel image. This way we can have a single
kernel image (along with various vendor-specific ISA extensions) which
works on variety of targets/hosts.

As an example or runtime probing you can look at how IRQCHIP or
CLOCKSOURCE drivers are probed. The vendor-specific ISA extension
hooks should called in similar fashion.

Regards,
Anup

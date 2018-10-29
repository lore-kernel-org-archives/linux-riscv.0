From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon, 29 Oct 2018 21:06:51 +0100
Subject: virtio-gpu without ARCH_HAS_SG_CHAIN
In-Reply-To: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
References: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
Message-ID: <CAEn-LTopspBXzoLZEFWQGxxC7uNJ9RZHiHyYmJPpWR4zKnj5zw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 29, 2018 at 8:47 PM Michael Forney <mforney@mforney.org> wrote:
>
> - Should riscv support ARCH_HAS_SG_CHAIN?

Non-expert here, but it looks like ARCH_HAS_SG_CHAIN
support is generic, and a number of well known architectures
support it.

So it's basically two line patch someone needs to send and
at least make a test by building the kernel. I can do that if you want.

david

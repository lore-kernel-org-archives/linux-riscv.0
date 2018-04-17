From: sols@sifive.com (Alex Solomatnikov)
Date: Tue, 17 Apr 2018 13:35:27 -0700
Subject: [PATCH v3 1/2] perf: riscv: preliminary RISC-V support
In-Reply-To: <1523954340-8708-2-git-send-email-alankao@andestech.com>
References: <1523954340-8708-1-git-send-email-alankao@andestech.com>
 <1523954340-8708-2-git-send-email-alankao@andestech.com>
Message-ID: <CAJ2AOiP1-TnSRdrLxowQ7DqzxoBYENfbO1ZR5A0_kwzLJ0WztA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Apr 17, 2018 at 1:38 AM, Alan Kao <alankao@andestech.com> wrote:

> +static inline void write_counter(int idx, u64 value)
> +{
> +       /* currently not supported */
> +}

CSR writes can be emulated: https://github.com/riscv/riscv-pk/pull/98

Or at least write_counter() should have BUG() or WARN_ONCE() or
something like that.

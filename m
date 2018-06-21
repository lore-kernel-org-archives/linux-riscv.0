From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 20 Jun 2018 23:41:35 -0700
Subject: [PATCH 4/5] RISC-V: Change variable type for 32-bit compatible
In-Reply-To: <3f86f9eb853380686a86a8abe6bda0dd3720ee10.1529506497.git.zong@andestech.com>
References: <cover.1529506497.git.zong@andestech.com>
 <3f86f9eb853380686a86a8abe6bda0dd3720ee10.1529506497.git.zong@andestech.com>
Message-ID: <20180621064135.GD19319@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> -	s64 offset = (void *)v - (void *)location;
> +	uintptr_t offset = (void *)v - (void *)location;

s64 is signed, uintptr is not, so this might change behavior and needs
an explanation.

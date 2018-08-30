From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 07:41:18 -0700
Subject: [PATCH 5/8] RISC-V: Rename im_okay_therefore_i_am to
 found_boot_cpu
In-Reply-To: <20180827184243.25344-6-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
 <20180827184243.25344-6-palmer@sifive.com>
Message-ID: <20180830144118.GA27233@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

>  	struct device_node *dn = NULL;
> -	int hart, im_okay_therefore_i_am = 0;
> +	int hart, found_boot_cpu = 0;

If you rename this anyway please switch to use a bool.

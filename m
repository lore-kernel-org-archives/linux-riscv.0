Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CC1CAC5A7
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 03:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iudCEjRwy6sBqfBtS6At8qvuEifZ9JXq3bT0bBPymRM=; b=bYwcg80t65iAGq
	EjVTleytENdmbPcNL1p7hWuRIlI7G1XLkT3/oA/yndl+g8K+/PpR4ibrhC68DNNX6cs9dMMeofgcZ
	RqPuqJHUR0ObyetOYwjKeT6JkFcxZet8PmR4ZgAqezGaH5jPbRaL5W44uyb7sF7Y4a9x3QICWBjRN
	pW0w5uCb64fHp+Uxq1NS6agqI+1FxZb7d5X/iM5Lw6OzKRnlDumD4St1ycMlyj7GziKcDB+4nZ1Oh
	l8HUHgddPdiLhSArSgwWxEaEZ7nTiGjIE0qr2OCbpqPn2Y1o5kzP5tqjq8u8R8txAWuQUq109qwFz
	08/g55yTU7p9YSGgKZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tNp-0000000CC3Q-3Kj5;
	Tue, 23 Sep 2025 03:08:01 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tNl-0000000CBuj-3rsj
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 03:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758596799;
	bh=4NPMmXQNPhh43Vfgs8uvOVv9B0WUHZ6XpV40eYHU7hc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=RWKLlsaTlI58dXRyasyafMHNEme2ISSX4TT25Uzqn6Deqd7W3+C1baDDLwFhsAKRk
	 PfKzkrrN5NFP+wL8liqjLsbMgwlayTBiDM5iomEUXCmzkwqrdgsdIwaT/ECJYMbdU1
	 CtLcyQfOMsT12q4tgek0QGyMEtdgR1BuHhVJOS3A=
X-QQ-mid: zesmtpsz9t1758596790t586b0683
X-QQ-Originating-IP: qX9i0wUg26C8yleLcKZzLZ0/pKDmgU7emqW0M+Rvx98=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 11:06:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14575087354260022270
EX-QQ-RecipientCnt: 17
Date: Tue, 23 Sep 2025 11:06:28 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	"fushan.zeng" <fushan.zeng@anlogic.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/5] clk: correct clk_div_mask() return value for width
 == 32
Message-ID: <261F7D53235844E5+aNIOtLYG1NcypGqr@LT-Guozexi>
References: <20250922-dr1v90-cru-v1-0-e393d758de4e@pigmoral.tech>
 <20250922-dr1v90-cru-v1-1-e393d758de4e@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250922-dr1v90-cru-v1-1-e393d758de4e@pigmoral.tech>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M5znx2hx04lbAaSFkX4IUNpl2egN75/K6UoQHZW6qbo6aGC5PSuz433r
	R3FqRT1DWG6Dc9GRECIMDApx69dETWLGyR7ZpKcR3Yxhn6i8YQfpqybkpLywLgj66YEiSB2
	ucLcGHbvqE+0OmmqdoUCTYlVzS/kRCMx/zBPne/zR6OyXCJblU2aBk+whLkDj0N0foo46BT
	/uxW7Mhf30oy/VHVYRF5QCnd05DrYTYMzFY1jp7JXx46/dgev4hB3GrWdsTNY+r9nWp/1MD
	DIU2kJccX4AYgMPcYPPMPe3WxQPkg3Q/4CwY5jfFzKbm9Qmx510sWYuqY65vgvIzD6FlFoj
	Z8Koy2gdeb6B8n7Ai8paqLe/hi75LiCb/BzKEMX8GbCEfnyWDG9mvLj3MxRT7MuTglr+T5w
	VjJzQ+1AdkHxU68jGLwT5jmcSUUmrEvnt+M1Pfq+nhZY3LiUoioRozI+mWzo+HKVbE1Z6PG
	l0GDQbKmQWQMegvUa4VIrxBCb27grSyOJIIp2LCleAJyeTyU6QqIPJrTC1gVwYxVoyS35Qj
	yHbCaVYFthJhdLKWl0L7XtdV6BLCkyGBfFUHGmVoLQ4OSE1vzitDj478GuVATQmCR3X2ojn
	yq2/IsFD22L0J4U5UZ0X/mNuENkT3ecAoIXHD/viZtmKvcTc9AbsNg71c6TH5y5ssLzeMcY
	2AIgsLEp3gj3TU9Z3zPIvRvozTtgSQmtg3ScuZT+qc9NZU3D1LLmmj9eloqbdZWmHytJEVa
	FMOj8Y5Ovomz9Bam1tCw2UAWEc4pFtq5TqFPCuj6KWcbR1zqiLQUkjlm0QEEo2f/Ptd6TpH
	sU0/nH4KpKvuiVWG3JaUo7e5fhiwmGfvbhWBaU2xx1ZanVh20ozvEG5WN8Y5E/cpEOmTEU+
	9yXikd0OS3fp1kM2FI2fz2d9j23pp8mSx5NQ0RbBwMJCw2qjb6rq1QhPDJRIFu5SCrFAlr1
	Z6/L9O1s6JyB0SPWaDcgKdvlYcnxePzsRZNGjPDKxBQMvVwngiQmH6IZpTSFAGuf31gbHGB
	Bc3cmu+8qv0oUHqBE+ENa9reOlOZp/L8cjl8J1QR6EKIzULz7j3w4ZZDG03bsHh5xbfTpno
	u5ztWZtjCnp6vbtE7z4vPY=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_200758_850623_9156344C 
X-CRM114-Status: GOOD (  19.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 22, 2025 at 10:51:47PM +0800, Junhui Liu wrote:
> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
> 
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
> 
> Fix this by casting 1 to long, ensuring proper behavior for valid widths up
> to 32.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  include/linux/clk-provider.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 630705a47129453c241f1b1755f2c2f2a7ed8f77..a651ccaf1b44ff905c2bd4b9a7043f9e2169d27f 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -720,7 +720,7 @@ struct clk_divider {
>  	spinlock_t	*lock;
>  };
>  
> -#define clk_div_mask(width)	((1 << (width)) - 1)
> +#define clk_div_mask(width)	((1L << (width)) - 1)
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>  #define to_clk_divider(_hw) container_of(_hw, struct clk_divider, hw)
>  
>  #define CLK_DIVIDER_ONE_BASED		BIT(0)
> 
> -- 
> 2.51.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

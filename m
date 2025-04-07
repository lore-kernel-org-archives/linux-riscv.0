Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B37CC3601E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suZ+MBJm+LNfhz4zZ3p+f6fNmwxuL0OLEYVRYnGxUo4=; b=3V6vCppHqv6gtf
	E++y19/S+EKaoSsJd8BV3B1iKixEWhJW8S41eM4FbVSRQ26kA8D0sfR62QEMkfXEdXvgl9qj9JvAn
	HklzBbVpoYv+3wldiCw/XKkO9p546xOlESpOxwRBdM6dm5uQqSR14N15sfGkyxXna7SnuarxdovlO
	rOyoq3Bvm5AicNNjRl5wGXpsACQ43chQO5v0Z+6Cmoa0gDWcUSv1008DzZ3LGh8w93NPgiRWpB25h
	WVHV4PJ/yoGvWpiK1qb4Ebo/dn0P4QPeleH1Zo+v2P4qxf+D+ApauU8DKCQuxbEm1TI6sLfl4gKr2
	7CER3tqKOhfJMMg+njVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1o9T-00000000tp6-175B;
	Mon, 07 Apr 2025 15:12:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n0c-00000000dGL-1hkS
	for linux-riscv@bombadil.infradead.org;
	Mon, 07 Apr 2025 13:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j7EJwBEMS5x8kbu/aqSrBl14aq4+PDD/GxXTjiwMbWk=; b=ZlkRn6cwgrEpxmNGrQoNjfgW/Y
	c7JXCgZqajXp9cQ3oNk9W/3CqbaLUuKu/cCU8Lc8QiHqDrPSHjzHqoxAaxHJhFtHnvDX0eniq1HRz
	cb+kHl8bGV7uswQhb6stBR5E5q+lKvcUd+rZHoRUafLVhwZr/1TaS3JpiDUX1WtYl1pVREPq45ZPI
	P2+y22yEpa3pRMKtUlDEkMN5494qQu70mRQTGw8C/d2GNorFVMHnkrrFFgLavZVQOk1J1Bc9WBPNe
	OmxRDW4mgxQhcos72gu1nSrUYLxlov86rYyJu1JnoWm0tRg/Yp1LUy4lroqtgubS70R9bhlHRCCg0
	Ou1r9iqQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n0Z-00000007xpF-2SdT
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 13:59:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0E6E5C00CF;
	Mon,  7 Apr 2025 13:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55286C4CEDD;
	Mon,  7 Apr 2025 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034365;
	bh=8s2WBNabZQFxBl7Vpsud+lJ/8w8F8nDe+peMa/6CfYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXG8+zHjOCj+V48R59reR4E1O9Q2qp21nTZlonWp9Xyp0ycMi0V/9lST8jdTr0JrB
	 dwa44fh0Om/zzKA0zGhuyNwgJ0BTsdSwrk6QZp8p3UGwoHZA0O0dLZiodAr4W829ZG
	 TUxObNX6z/efLUgEv34gVPOMdySNc0fUQDCPZe7b4T3sGHYDcLThD8icihBOG8/kN+
	 uTKEbi0PwlM+9+WH5COIS7hYG+6oEuN2nvg/YVU5dAjKKt/kHkgWwePWd4N/KkT1kq
	 zDWY70pHKi3qVH9AjH7qXgKhX0cG6jwP/4slFVjbxAE6EyzKWkS5OHwpfyF+1fNF7s
	 t2QGiCC2GYohQ==
Date: Mon, 7 Apr 2025 08:59:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-riscv@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Yixun Lan <dlan@gentoo.org>, sophgo@lists.linux.dev,
	Chao Wei <chao.wei@sophgo.com>, Longbin Li <looong.bin@gmail.com>,
	linux-i2c@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	ghost <2990955050@qq.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Chen Wang <unicorn_wang@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-mmc@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 5/9] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
Message-ID: <174403436377.2164588.13246068752333809704.robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-6-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-6-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_145927_826811_98AE94AF 
X-CRM114-Status: GOOD (  10.51  )
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


On Mon, 07 Apr 2025 09:06:10 +0800, Inochi Amaoto wrote:
> The MCU device on SG2044 exposes the same interface as SG2042, which is
> already supported by the kernel.
> 
> Add compatible string for monitor device of SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

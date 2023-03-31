Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49A0C761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNjuiSWoGkRhXCodl0QJoYNNIFqLtpl4jL8AqkRkx5U=; b=pljfo/JNvEJGsq
	ezNI/JN4UaNlqQ2Iv1tDk3DDzYTrijCvjV33hEqxEOoOKvzxEsV3Mzjxg+bgTA7i9ozvF80NKd0Rl
	Rr7qlRSMxTRdrokWywP3OV0RkxVWDbTC7RVPj7+s3dnSZ2JtbWXtKJUz4RiS3wc+qNMFCEgUWsFCG
	z0Kh3cpQ20rrW0m19pqS9F2RRs7L0jgSOhgp9M4bN5StQ2tcm4ivvodH2R6t8WVKeZW4thrn8QPGl
	uX500o2HptmJC7nebOLHzMwoFPyLntTwSF0KA3uJU0452aN/DHLGrWrBIsdI5C46efFPa20zwlRCg
	ii/McVssn5yGYWssYM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piHEJ-00809M-2k;
	Fri, 31 Mar 2023 16:03:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piHEF-00807r-0K;
	Fri, 31 Mar 2023 16:03:53 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1piHE8-0004hH-Uv; Fri, 31 Mar 2023 18:03:44 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v17 03/20] riscv: Add new csr defines related to vector
 extension
Date: Fri, 31 Mar 2023 18:03:44 +0200
Message-ID: <3030152.CbtlEUcBR6@diego>
In-Reply-To: <20230327164941.20491-4-andy.chiu@sifive.com>
References:  <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-4-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_090351_161445_F5EC33C2 
X-CRM114-Status: UNSURE (   6.11  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Montag, 27. M=E4rz 2023, 18:49:23 CEST schrieb Andy Chiu:
> From: Greentime Hu <greentime.hu@sifive.com>
> =

> Follow the riscv vector spec to add new csr numbers.
> =

> Acked-by: Guo Ren <guoren@kernel.org>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160ACC76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93uFb7StVJ0KWTou3UwmdtRVUEFZhZUxWbHZ60MFzLg=; b=ndGd0Cjgq9iuf9
	jVLHZVjCexQtaEHeVYJOqreBuhRnwtUWrv4ArI016Q2K+UOxdZeJzoHFwu7GMW6hhWePmjMzCRb64
	Ly5AEdGTIwPFQ/X8nOqGDfB9VBQtfGUZlfGMfAdzmrGYV7USpKiDz/XeFGKVmhIor/3Hx+5Ut4ODq
	QehXF6usVvWAls0HRGLqDmkm+ii4ruaPGxRKRAM1dS8UbC0JeQaJicqhV5Y56vHmZUd8MYtkoophZ
	wVyL8Z/oVSdBb+8a5MgPernIHwYrHrJ22+KDdqvQYRCw/y/TrA1roCpjw+0WI3Op2WpNHAeMdZBYl
	/bzzCkmfbesmo/VwrK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCnf-0076PT-1C;
	Fri, 31 Mar 2023 11:20:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCnc-0076Os-2f;
	Fri, 31 Mar 2023 11:20:06 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1piCnM-0003EW-O3; Fri, 31 Mar 2023 13:19:48 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com,
 Jisheng Zhang <jszhang@kernel.org>, Nick Knight <nick.knight@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, vineetg@rivosinc.com,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Ruinland Tsai <ruinland.tsai@sifive.com>,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 greentime.hu@sifive.com, Dmitry Vyukov <dvyukov@google.com>,
 Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH -next v17 09/20] riscv: Add task switch support for vector
Date: Fri, 31 Mar 2023 13:19:47 +0200
Message-ID: <3155083.5fSG56mABF@diego>
In-Reply-To: <20230327164941.20491-10-andy.chiu@sifive.com>
References:  <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-10-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_042004_867731_447D2C63 
X-CRM114-Status: UNSURE (   7.59  )
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

Am Montag, 27. M=E4rz 2023, 18:49:29 CEST schrieb Andy Chiu:
> From: Greentime Hu <greentime.hu@sifive.com>
> =

> This patch adds task switch support for vector. It also supports all
> lengths of vlen.
> =

> Suggested-by: Andrew Waterman <andrew@sifive.com>
> Co-developed-by: Nick Knight <nick.knight@sifive.com>
> Signed-off-by: Nick Knight <nick.knight@sifive.com>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

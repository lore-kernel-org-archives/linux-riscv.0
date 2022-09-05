Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642F6ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 19:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RA083CvezXB4CZGaMBS4ZppqR1y5a5uT3m8xLx9mNJA=; b=TlLhhS6ja7dFf8
	cH08xhwyNtl8+xSp90+wBLUV66xa20f8BNflFn0r/dlRBscHoBPk5wxfQgFJmABx3eOZoBuTQZC7w
	rF+mHApzGbGdx1/0IjEXffcYhQsuOmhnmivzGvf5HPJguWNnEzefjgmspgkGwJMQkUNIkWvksO8uf
	XuuSzuqdFh2pNZI2ZVH1gxClxl7K87N8f7V9ExPK9ocZvVnXRvrHIB8Ht9y0eX3kA52BQ0+lbTaOE
	1b3OdJTuXgJ66IzLnFduHen3n+49oIW6dwEavq5lMjZ2gSJcgKR8lm4KUZn8CWxrwFAi/rqShBIsV
	9JURYnbTC6J+Sg9GeT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVI0l-009YfQ-J2; Mon, 05 Sep 2022 19:44:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHb7-0096Br-70
	for linux-riscv@bombadil.infradead.org; Mon, 05 Sep 2022 19:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=auzO3/W9vf/Bw0z2PJb7xUW1rRQMsFhli5k2dKEQem0=; b=bs6BgQHhACk0k84+VsptG8+kfM
	2o3sTp8lWFUoaXPJaA96k0alIuTCfdcAyOZoTwFQ9T1P3QX/FL4DDCn+/UGjj10ncTvoqnAwUKhwN
	WQOynAJhcWGUKSpWdh0lQGyTyavaj04FQF7g3tf0oeYHTXNHO8AylA9PG2OR5kh57qSqT/nypM+lF
	8B8jb+aV9aiRWlKoXdWX75062UdkNrTEvboLqQj4I+7fSAbWk2SrXxIL6baiV5qnJn1iaVl4+e/ii
	beeJS2VRLaRafp1hrIYahALRIosbgzYO7cA01oZ2FLB8JIDokTpGdlR+JVGchXIiEXzCgqwLtcHAY
	7oloTADA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHKF-009vx1-A3
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 19:00:05 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oVHK7-0001BA-Tp; Mon, 05 Sep 2022 20:59:55 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andreas Schwab <schwab@suse.de>
Cc: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com
Subject: Re: [PATCH v3] drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores
Date: Mon, 05 Sep 2022 20:59:53 +0200
Message-ID: <8712127.JRmrKFJ9eK@diego>
In-Reply-To: <mvm4jxlao6f.fsf@suse.de>
References: <20220905141644.2468891-1-heiko@sntech.de> <mvm4jxlao6f.fsf@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_200003_524946_F4EEE951 
X-CRM114-Status: GOOD (  11.96  )
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

Hi Andreas,

Am Montag, 5. September 2022, 16:30:48 CEST schrieb Andreas Schwab:
> On Sep 05 2022, Heiko Stuebner wrote:
> > To work properly, this requires a matching change in SBI, though the actual
> > interface between kernel and SBI does not change.
> 
> What happens if you mix different kernel and SBI versions?

The interface kernel <-> sbi itself is not changed at all and this of
course only matters to t-head c9xx cpu cores, so I guess we have
the cases:

- non-t-head core:
  no behaviour change independent of versions


- t-head core with everything "old":
  would just uses the regular sbi pmu setup, but as the necessary
  sbi-side pmu config for the c9xx isn't set from u-boot
  (dt-properties mapping sbi-events to the values needed to be written
   to mhpmevent*), this is broken anyway with standard sbi
  

- t-head core with "old" kernel, "new" sbi:
  kernel does not detect the extended features, so should fall back
  to just use the standard pmu features
  

- t-head core with "new" kernel", "old" sbi:
  Same as everything "old", pmu isn't setup correctly in sbi anyway
  for the c9xx at the moment


Heiko  



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

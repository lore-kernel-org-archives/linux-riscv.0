Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834E6EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:Subject:References:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oINXPqarr6dirWMwWxBLL+n6bN69Lmk34cSYpHTERmg=; b=mUICo1DXw8Ejyq
	Kg5DdyWWkVSuqvbio76dZs3bArAhoBed9xHMC92VTwRNwXyLjFMGSoQ8GDjMKJ8Mhgrl5DeZlDPsK
	o5JSxdHnvDS9Ew/++/ePBc+24dTd9W7I+8pVwsDlPtSfQnJUp3cwdWhPUw6RVaf51/iiXIc8RTho5
	Y4WixjLVCNiasUmN82jXswKMSBQVLwki2I8KTNo9sbhF4AsJ36RokQdL4YLmFjSHk09I4TRJjA9mm
	UXyX0iZeWNSgg+FIJLJsLB6CVakI3lNynzzgjq0p3yHWRlhI3WS3VcbB9hkMWJwBFSOp3CrFmp8wn
	2F//CCwn0TA+zL76td+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qETF9-00FZYz-0F;
	Wed, 28 Jun 2023 11:21:51 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qETF6-00FZXe-0C
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 11:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1687951263; x=1688556063; i=markus.elfring@web.de;
 bh=5NJdvWC2f6mHNaQfg2ZPjggVxnT9uJ+mPCB381+9+fE=;
 h=X-UI-Sender-Class:Date:To:References:Subject:From:Cc:In-Reply-To;
 b=JrPdmAl64FXrzB6pOjSmoVMeFbjuioHBEQUh4M0r+zmBZf6f3aqZi55Fx56uPOgT4jmAVAr
 Oo5KKcScu5FN9hMzC1Rv6jE5PRzni75PnBGh6Nts9h51+dAUJfjZYdSdoj8F9cgtf8wWNXNdK
 eCUD+eZYeGrMnT7t3Cs46535Wtv/njVLqfhZ5ecIxVuPPQcmHQhBCMeT/Jm0pO9dQ6xM92lAW
 HdC+ulz0roS5xJh0v4q6+/59PHMgbEvZ6uRCZ89YPuhjyWgWD7CuTF6D+orr0j/v7xZffGN86
 uWeK2zFCK+uvI47Mc8RfCHQjhIw6chUKBA7THiCfys05AdzE1cdA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MqZQY-1pjpJX0vNw-00mnrI; Wed, 28
 Jun 2023 13:21:03 +0200
Message-ID: <97a7d701-3b48-252e-6d78-ef3d0e7f8f03@web.de>
Date: Wed, 28 Jun 2023 13:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Samuel Ortiz <sameo@rivosinc.com>, Hongren Zheng <i@zenithal.me>,
 linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Jiatai He <jiatai2021@iscas.ac.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
References: <20230627143747.1599218-2-sameo@rivosinc.com>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux@rivosinc.com,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>,
 Guo Ren <guoren@kernel.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Stefan O'Rear <sorear@fastmail.com>
In-Reply-To: <20230627143747.1599218-2-sameo@rivosinc.com>
X-Provags-ID: V03:K1:L6UzMA8al0fQpRHYvoMSQRix/pyz0MHhfvEdS5FQx+iTF/KmO1k
 OvB7mi4glgJxUKe+olxDe6GCdubOgpLKiQRYXizA+XGEesrGMubPqNWbeBqsvWN4+K8zQvn
 762qbZ14ru7PLhPTAplucxo1A5LeNCOVv9atSjcYdRKM3Tey1Kc0J4RC+f7rDMWdYN2PuAQ
 WsgoCojhMozdrlJqaSaog==
UI-OutboundReport: notjunk:1;M01:P0:mzWQnvYJQwk=;LT47sAFOiDSWGpJeLhhefDGzmNd
 tWbHTaLdJUxnZzouiqCMJTLCIE20V4R0V3M0/Ysrw1pBSo83IZffiGQMBebBnV0gc4i4sX+I+
 MgKykcalCdRRzU8/k+Z0QkxZkDvy1phgPCG+/f/l7vkM/5JHxd4cNEyYkaLKvyMZ+suVHREme
 jrFoV0unHtZ7tRmMzFuIJ5S7FCBLe61SlVMczkf6TBx7XYyelgp24t4gRpY2b/qhoQWtfh8Sj
 XaWTKWVEosWcPuLn9hZkhBcsFun64jM8hAW/Tv0jpYPN9vFp3M6nKWrpJ+flzVrKfZG/oHwm1
 guDir/qXYIHdNsLXA3g/VaYq853mvg7S0r/mmXgczZyuoSgX0ed/xj4WDH7qSWoI1qm1HJaBR
 xR8qJIO7+yg8NjF1lVscZ1DBWAAAHxDCs4bLNvRmAW7C5nzBCH3PuWiPrWZb6dCfPXO/NzmiS
 CTpquUfrmU23TXdaw4pNCGM6v7o269uGu4gN2CeY5JcUdI+W/kEFGrEdJIb3kHIdwYltQX6RA
 cthPR4nFl0mwVL0JCpD64upLCaejyjytwflQSjhW5st9r44JaCJWByKIc0/Gnlx++ZkEIIpxD
 Vr5zkh7vRH1jbVBDdnlk9kkoAfFdS4FMGjMbApPRLaGrgwr52cpeQP6+bZYQ+CM4DgUyb7zJX
 cczf5e5tgvee5Wln0WA08i1PLDtlQjbzddyT6/Q1FdIea2hHhwswISyjUuSMARPtXFotKuonJ
 PIvRvKNPfY+evFf02HrYuZyYe+prn32BlKqYYWreOgr+myuM5qgmoVdfHCyxBiWHjjqfSYgQH
 kEoL2jr4z4qmC4PAqHurYSfFGPNwl11zk+jT1k8hzfztzapQn543LAy84Vc/avddHUO2bziRo
 r/1FR4g/QeY36X7MC3DxYzzJzqzz35K0PPNn6BUGbnObTMOt9nHolrImQ6W0KB8RnLO53oZEq
 HKnkfA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_042148_579997_FA0FEA43 
X-CRM114-Status: UNSURE (   5.36  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

4oCmCj4gVGhpcyBwYXRjaCBhbHNvIGNoYW5nZXMgdGhlIGxvZ2ljYWwgaWQgb2YK4oCmCgpEb2Vz
IHN1Y2ggYSB3b3JkaW5nIHJlYWxseSBmaXQgdG8gdGhlIGtub3duIHJlcXVpcmVtZW50IOKAnFNv
bHZlIG9ubHkgb25lIHByb2JsZW0gcGVyIHBhdGNoLuKAnT8KClNlZSBhbHNvOgpodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
dHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9oPXY2LjQj
bjgxCgoKUGxlYXNlIGNob29zZSBhbiBpbXBlcmF0aXZlIGNoYW5nZSBzdWdnZXN0aW9uLgoKUmVn
YXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==

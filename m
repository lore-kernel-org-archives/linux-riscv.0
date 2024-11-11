Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD41D3ABCE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1pujkVDsj4GmcHzwOwES/kFMl3k6WZjaguqODd+XmA=; b=IKv1GFRqTkh1TJ
	sCCjJIu/rZ+aToAVb7+oKDxaFdmxKmszdnoW72BjTiRu2Mmiqxk7zO7V0MIkNN604qZWSpUs8dxC1
	9oXZGDTs7K5CMUmzd1jsWRPeeSPQgBtWXLMGY5CcY/MafqVMOFCqk0WXpnMwLymm5BFp8ztnAdz+2
	IkYhU2R0lzRF74Y2YSLJTnlp+FJjsDd12ufN6MqemJZ1t0PKJB8Xwkr0XVeb8nI36Q/1Ls8LfEdoM
	i80be6MIoZyvfB3cVa4cGRZ9YaiWKyHMQDa9Y8VjNF6pKgU56bA9GZHyHRcmgxB5ELWSURo72sOI0
	xZQSFy8dxSQ4LcSkPlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXxj-00000000gHU-2f81;
	Mon, 11 Nov 2024 17:12:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXwK-00000000g1t-2qbc;
	Mon, 11 Nov 2024 17:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8EC55A40CE9;
	Mon, 11 Nov 2024 17:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A663C4CECF;
	Mon, 11 Nov 2024 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731345059;
	bh=mQcF4blWKVkXGoS5x+iNT1y37ntZRzSWV0O2NUHI8Pw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JmK7W7bu5pSk75hDiHLH5W/ZjQRfG+BAkS6pMUPUO3ENDcPfrmtjJqHUClZ2VfenK
	 2VF93iYVT2jnTNrML4DysmzIiDIPGjmZh640ebKA1RZ+qVxv0bKhxa4thVkuRN1vfj
	 OJp0t6sPobdonn7QuVuq7Q7uyXY/gth/J3mfppkICuwb0/HyBF6pPRY/4msl5+vNUV
	 NRfpxkNwl52+ZalTbHcm7zmOJrgUHtYBsWHAJdgLkZwm0gm6El2OOyISKMmPLJ5piP
	 Wo1AQTLKwscxyQYNYCJv3Z+0VL2yS6EJuVjXr6u+5NpDGfSY8bG3nUXjcrh9AlNw1C
	 aeLB630sHmHeA==
From: Will Deacon <will@kernel.org>
To: Julien Thierry <julien.thierry.kdev@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH kvmtool] riscv: Pass correct size to snprintf()
Date: Mon, 11 Nov 2024 17:10:53 +0000
Message-Id: <173134344938.1668143.13537130235205302790.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241104192120.75841-1-bjorn@kernel.org>
References: <20241104192120.75841-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_091100_800929_A1A895B0 
X-CRM114-Status: UNSURE (   7.13  )
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

T24gTW9uLCAwNCBOb3YgMjAyNCAyMDoyMToxOSArMDEwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToK
PiBUaGUgc25wcmludGYoKSBmdW5jdGlvbiBkb2VzIG5vdCBnZXQgdGhlIGNvcnJlY3Qgc2l6ZSBh
cmd1bWVudCBwYXNzZWQsCj4gd2hlbiB0aGUgRkRUIElTQSBzdHJpbmcgaXMgYnVpbHQuIEluc3Rl
YWQgb2YgYWRqdXN0aW5nIHRoZSBzaXplIGZvcgo+IGVhY2ggZXh0ZW5zaW9uLCB0aGUgZnVsbCBz
aXplIGlzIHBhc3NlZCBmb3IgZXZlcnkgaXRlcmF0aW9uLiBEb2luZyBzbwo+IHdpbGwgbWFrZSBf
X3NucHJpbmZfY2hrKCkgYmFpbCBvdXQgb24gZ2xpYmMuCj4gCj4gQWRqdXN0IHNpemUgZm9yIGVh
Y2ggaXRlcmF0aW9uLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIGt2bXRvb2wgKG1hc3RlciksIHRo
YW5rcyEKClsxLzFdIHJpc2N2OiBQYXNzIGNvcnJlY3Qgc2l6ZSB0byBzbnByaW50ZigpCiAgICAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvd2lsbC9rdm10b29sL2MvNTc0YmQ3YjQzMmVjCgpDaGVl
cnMsCi0tIApXaWxsCgpodHRwczovL2ZpeGVzLmFybTY0LmRldgpodHRwczovL25leHQuYXJtNjQu
ZGV2Cmh0dHBzOi8vd2lsbC5hcm02NC5kZXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK

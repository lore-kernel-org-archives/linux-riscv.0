Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407BCC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3QdFc0+IDEFyozJLLLK5OlA2WR3g12KwpEkiclY0y90=; b=avbRKcsQz/vWpX
	NJHCcTpF5MG8iCeobQlNdtsB8ge9KunxIG9LqKH0T78ny8DlbiiFieUHIJNVFqm2PJDd3ZGoRFi5M
	ZmHP7dARXYIzcSCbgfOuB0J5s/HPNvgkLHkI54eHP6fa+AROxuSwuetarv+6vkol9pqqnA0US3tTr
	cUJti7lqmNiwmimITGfaRCsoBJR+PklTUo0obTpRGkI7BXetTX8Qys9Wk79oUXGyiVDwNR/TOFWQU
	EZG7KHRlhysf1uF8DpgiRgXfMO3+P58++PXYJBBxY4kiv2kuRZbk/g9dtJL63eySpyoE4pVMvVfWq
	12zCou/wvbRinw0VxsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jRz-002Pjz-S6; Fri, 24 Jun 2022 13:34:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jRv-002Pgx-KR
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 13:34:17 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LTyjQ3xHWzkWgD;
	Fri, 24 Jun 2022 21:32:42 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 24 Jun
 2022 21:33:57 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<lizhengyu3@huawei.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] riscv: kexec: Fix build error without MODULES
Date: Fri, 24 Jun 2022 21:33:05 +0800
Message-ID: <20220624133305.24080-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_063415_880712_70296FA0 
X-CRM114-Status: UNSURE (   6.28  )
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

YXJjaC9yaXNjdi9rZXJuZWwvZWxmX2tleGVjLmM6IEluIGZ1bmN0aW9uIOKAmGFyY2hfa2V4ZWNf
YXBwbHlfcmVsb2NhdGlvbnNfYWRk4oCZOgphcmNoL3Jpc2N2L2tlcm5lbC9lbGZfa2V4ZWMuYzoz
NTI6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmEVsZl9SZWxh4oCZOyBkaWQgeW91IG1l
YW4g4oCYRWxmNjRfUmVsYeKAmT8KICBFbGZfUmVsYSAqcmVsYXM7CiAgXn5+fn5+fn4KICBFbGY2
NF9SZWxhCgpBbHdheXMgc2VsZWN0IE1PRFVMRVNfVVNFX0VMRl9SRUxBIHRvIGZpeCB0aGlzLgoK
Rml4ZXM6IDgzOGIzZTI4NDg4ZiAoIlJJU0MtVjogTG9hZCBwdXJnYXRvcnkgaW4ga2V4ZWNfZmls
ZSIpClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L0tjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNo
L3Jpc2N2L0tjb25maWcKaW5kZXggZDZhMDdiOWFkZDA1Li5hMTE2YzlmMTQ2YTggMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTExMSw3
ICsxMTEsNyBAQCBjb25maWcgUklTQ1YKIAlzZWxlY3QgSEFWRV9SU0VRCiAJc2VsZWN0IElSUV9E
T01BSU4KIAlzZWxlY3QgSVJRX0ZPUkNFRF9USFJFQURJTkcKLQlzZWxlY3QgTU9EVUxFU19VU0Vf
RUxGX1JFTEEgaWYgTU9EVUxFUworCXNlbGVjdCBNT0RVTEVTX1VTRV9FTEZfUkVMQQogCXNlbGVj
dCBNT0RVTEVfU0VDVElPTlMgaWYgTU9EVUxFUwogCXNlbGVjdCBPRgogCXNlbGVjdCBPRl9FQVJM
WV9GTEFUVFJFRQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=

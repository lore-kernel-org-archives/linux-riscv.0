Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97D4C46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sm3+kjrPDYvNBnhD75fwr7ZCYzjs+dsYY9yB+Bj5Bg=; b=obIKS3/o2kIoV9
	2cxU8F9uBjo/rkZeB04m+0ky4gM+vZeKIdwHY4G5EXShQZogKrDDfI09W8cXSggxqzQ+m9uEUGX1w
	VtBEznHiiU6q9uZJPrpmMMwkUHb6BMG42X0KXTOwYLLpK0oCPtNy89FNmMVRrmEPW/QVLoz5xINHM
	+5+IyZpuYKZEN3zFp1inTln4TdJg88P755IzDVgZ+paFMPkLYSng4E8FxFNGvjKMhlMKV3KuYV6uy
	0CXSFitI1anj1TraPCmfx0zcGr+11sw9DUQnvgC41y7Hkee19ZxGSGhIeNnOZX3SRkmfoWcOBrvGG
	bAb0pBphG7H/oRTBqKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzbx-007q9Y-Ng; Wed, 04 Jan 2023 08:59:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzXd-007oMB-O2
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:54:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C97C9B810FA;
	Wed,  4 Jan 2023 08:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EE6C433EF;
	Wed,  4 Jan 2023 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672822470;
	bh=NSTw/vhp+SBtVWvTIpyri3iq9dAh1xUqGLzn3UaRiSg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lEbmH/KdTiqyjLf2n2kxJGdwbFL4US2npc+yqQqjlUWRd4Xq/L+KkonnPG4dQOg3L
	 0ofiTjZrhPTcTpjrYS5g5alLwYyBn8hq26ZT7n9IDctvnpEI1wFiisB92cgdQ8odlN
	 A4N4NKMIkSYBgyPyFyquzyxcboo50Gp+eYI5b/2vSQk9ZeyquISURPl0bs+4WG72uj
	 pwsgsSPUbKU9dN4wauWuFys484gvjvVzgsc5Cd8rkvaZ3w2NAHZanfypFVjFUyn7Q5
	 mAjvvsNhxe7xc1C1jQrmaZqSO45CuGxJgxybAkSmAvkXxT9RRNczr/hnBtKbMwfL0+
	 3fOgXh4k216hg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: "liaochang (A)" <liaochang1@huawei.com>, Chen Guokai
 <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/9] riscv/kprobe: Prepare the skeleton to prepare
 optimized kprobe
In-Reply-To: <9dacbd7a-6dc5-099c-d427-b20bfa22aabd@huawei.com>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-4-chenguokai17@mails.ucas.ac.cn>
 <87v8lovmoa.fsf@all.your.base.are.belong.to.us>
 <9dacbd7a-6dc5-099c-d427-b20bfa22aabd@huawei.com>
Date: Wed, 04 Jan 2023 09:54:28 +0100
Message-ID: <875ydmsmrf.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_005434_002045_9D813A1C 
X-CRM114-Status: UNSURE (   7.88  )
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

ImxpYW9jaGFuZyAoQSkiIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+IHdyaXRlczoKCj4+PiArCSAq
Lwo+Pj4gKwlyZWwgPSAodW5zaWduZWQgbG9uZylzbG90IC0gKHVuc2lnbmVkIGxvbmcpb3JpZy0+
YWRkcjsKPj4+ICsJaWYgKCFpbl9hdWlwY19qYWxyX3JhbmdlKHJlbCkpIHsKPj4+ICsJCS8qCj4+
PiArCQkgKiBEaWZmZXJlbnQgZnJvbSB4ODYsIHdlIGZyZWUgY29kZSBidWYgZGlyZWN0bHkgaW5z
dGVhZAo+Pj4gb2YKPj4gCj4+IFJld29yZCBmb3IgcmVhZGVycyB0aGF0IGFyZSBub3QgZmFtaWxp
YXIgd2l0aCB4ODYuCj4KPiBPSywgQlRXLCBpIHRoaW5rIHRoZSBjb2RlIGZvbGxvd2luZyB0YWcg
b25fZXJyb3IgaXMgZmFpcmx5IHNlbGYtZXhwbGFuYXRvdHksCj4gcGVyaGFwcyB0aGlzIGNvbW1l
bnQgaXMgbm8gbmVlZCBhbnltb3JlLgoKRmFpciBlbm91Z2ghIDotKQoKCkJqw7ZybgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

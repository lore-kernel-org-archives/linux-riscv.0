Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4BCC47096
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 04:53:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C943B613D7
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 04:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C943B613D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:
	Subject:Cc:To:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/YWXoeiXQyXW8HA+rEahRQxisWP9H1iN5e7Tph6oPx4=; b=Cmuy2RmRbR/53e
	U9cxe7fQzzrgQo4/u5fLk4gKmC1C/sy1NHd1c9PcwyVpVU5hYcGLZ+0HIG9dcx0oQyCaAbfAeF0/3
	q9JB/9LpqxUozs0dmDr+J8UEaSH1ev8nZ5lLd2DeMP8H11sKeRc4V39WjSo6x8uuHq+8VmrfIsPWK
	97xCT1Eb5vjkHcbmS0x0u2/GtEsNQRF6qQZpvxDuDlZPsq7RLSfZu273BLwgKkgupji2iLq8ceVhh
	A8nALrwEDv8o9i/6FBMao2oDCRp/q2ntSVp3aiwo3fWzFMrX33Tz2iKZe/vM7aIN0fcDN/WIaj7vr
	j9bp2OdxLxVu1mDKSN6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lofJQ-0076is-FW; Thu, 03 Jun 2021 04:50:32 +0000
Received: from mail-m17641.qiye.163.com ([59.111.176.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lofJN-0076ho-JY
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 04:50:30 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m17641.qiye.163.com (Hmail) with ESMTP id 431786012C;
 Thu,  3 Jun 2021 12:50:26 +0800 (CST)
Message-ID: <AEkAVwCrDqnnn92uf85TYapl.3.1622695826260.Hmail.wanjiabing@vivo.com>
To: Fangrui Song <maskray@google.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Wu XiangCheng <bobwxc@email.cn>, Bernard Zhao <bernard@vivo.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gW3YyXSBkb2NzL3poX0NOOiBhZGQgdHJhbnNsYXRpb25zIGluIHpoX0NOL2Rldi10b29scy9rYXNhbg==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.213.83.158
In-Reply-To: <20210603034545.oe675lrtvtsvbedb@google.com>
MIME-Version: 1.0
Received: from wanjiabing@vivo.com( [58.213.83.158) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 3 Jun 2021 12:50:26 +0800 (GMT+08:00)
From: Jiabing Wan <wanjiabing@vivo.com>
Date: Thu, 3 Jun 2021 12:50:26 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGh9PTFZCQxkYTx0ZTEwfSU9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1PS0lLTkhLTUxCN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6PhA6LQw4CT8KFRUVQkkOHUNOLyIaCxdVSFVKTUlJTUJOQ0lNTkJDVTMWGhIXVQwaFRESGhkS
 FRw7DRINFFUYFBZFWVdZEgtZQVlOQ1VJSkhVQ0hVSk5DWVdZCAFZQUhOTEo3Bg++
X-HM-Tid: 0a79d035536bd997kuws431786012c
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_215029_839711_5FCF79AB 
X-CRM114-Status: UNSURE (   2.78  )
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

IAo+UmU6IFtQQVRDSF0gW3YyXSBkb2NzL3poX0NOOiBhZGQgdHJhbnNsYXRpb25zIGluIHpoX0NO
L2Rldi10b29scy9rYXNhbj4KPiBUaGFua3MhIFdpdGggYSBmZXcgc3VnZ2VzdGlvbnMsPgo+UmV2
aWV3ZWQtYnk6IEZhbmdydWkgU29uZyA8bWFza3JheUBnb29nbGUuY29tPgoKWWVz77yMbW9yZSBl
YXNpZXIgdG8gdW5kZXJzdGFuZC4KSSBhZ3JlZSB3aXRoIHlvdSBhbmQgd2lsbCBmaXggdGhlbSBp
biB2My4KCj4+K+WGheaguOeahOWFtuS7lumDqOWIhuWPr+iDveS8muiuv+mXruW3suWIhumFjeWv
ueixoeeahOWFg+aVsOaNruOAgumAmuW4uO+8jEtBU0FO5Lya5qOA5rWL5bm25oql5ZGK5q2k57G7
6K6/6Zeu77yMCj4+K+S9huWcqOafkOS6m+aDheWGteS4i++8iOS+i+Wmgu+8jOWcqOWGheWtmOWI
humFjeWZqOS4re+8ie+8jOi/meS6m+iuv+mXruaYr+acieaViOeahOOAggo+PisKPj4r5a+55LqO
6L2v5Lu2S0FTQU7mqKHlvI/vvIzopoHnpoHnlKjnibnlrprmlofku7bmiJbnm67lvZXnmoTmo4Dm
tYvvvIwKPj4r6K+35bCGIGBgS0FTQU5fU0FOSVRJWkVgYCDmt7vliqDliLDnm7jlupTnmoTlhoXm
oLhNYWtlZmlsZeS4rToKPgo+RGVsZXRlIFplcm8gV2lkdGggU3BhY2UgY2hhcmFjdGVycyBvbiB0
aGlzIGxpbmUuCj4KWWVzLCBJIHVzZSB2aW0gYW5kIGZpbmQgaXQsIHRvby4KCkJUVywgSSB1c2Vk
IHZzY29kZSByZW1vdGUgZXh0ZW50aW9uIHRvIHRyYW5zbGF0ZS4KSXQgc2VlbWVkIHRvIGJlIGEg
YmFkIGlkZWEuCgpUaGFua3MsCkppYWJpbmcKCgoKCg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

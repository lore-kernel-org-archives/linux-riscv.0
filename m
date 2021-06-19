Return-Path: <SRS0=/fWr=LN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D1FC2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:21:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 052026054E
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 052026054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=powB8EbYUOlgeG89scuotrEofSTXLhn37B1ScB3dou4=; b=eyxZh34KTRUYYZ
	nQ59h/i4xcdZH69PtJS7eEzqYwsN0xwjAEFJK8IPwQiuIgGI0frI/Yr69pP2pZshAt3fF3J+3/I4c
	lQfe865BOQxIiiK2KFDW27nqDqIgvyYvqZBlwwzETPXKQojao+hrYoqNQTX/gIX0wdtzkYrOVkDUK
	CpRMcvIvFrM0oa/7Dd69wH1yaVMHtxrfvTFP3HzwMh0LCDCVvgWWs+d4vyz6ZMVnAZmDwIYTF39/d
	1HBe51MR950BFF05r7br8yNQcG9Yf2GLoDoPGmxf5U/Eb6DMHFQZP9ZrryAcnjMMXqU4DEZzDibcr
	u7P6d3aw8pMiGgl2Awmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luZ2U-00Grc8-B9; Sat, 19 Jun 2021 11:21:26 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luZ2Q-00GrbS-V0
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 11:21:24 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 t19-20020a17090ae513b029016f66a73701so2341040pjy.3
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jun 2021 04:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=vF9uOfHJd5f9mPzqhhnKRBmuIenlnkTe2hqoo2WNujU=;
 b=jAcNBEWYtlgil0B8TcQV7IQbsRXT3FQsWsDLHO+2T1Ffyy6WccQN/jydqkKOSWB8AI
 pogmvFeIUzz+zjyROLCR+PLIFTXtDFneTZ1FIzUoDVUBBbMC1Crpofblz5ShHlDHvH4b
 7a8+wCPKFbUnA9w9Hw4BGgv2tMIwMsftki8nHinptNBWBbFZejX3w18AyXuulYyb6A96
 6qS0gSTtaLgI78bl/mpHi3UOrNkoVLhKNwlu1QVjwYnAljQwB6rg9Xhha1s4okjT+ojM
 5pOZAv1rWdGS2inD+2jhDwUVNoq1NA8U3r4YKuZ8WhaULE9XiGeDsCWkqSokbrRsuBTU
 ST6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=vF9uOfHJd5f9mPzqhhnKRBmuIenlnkTe2hqoo2WNujU=;
 b=jHs//wlLJdEbFofW4EIsz4MSQL4JQest9nXluzAfMsfvVYDTnJVGr3dctvRlFK0WCn
 6QZcaVxOzipE8iGCBq5dH+hZN2p73TfKF1Szb5k9qa8ApzC5CQDJou33GO/TO9KlwbV0
 MCP4s4y3SCaxjYfbmap0yzO5yl5+iYM1gC6XIZfQ8FJdUQm4TPxVrPOG3LAg0PzKMo1w
 6hPD0Iu9NsgbrLTCn01vx5iroQ7pftkXUEyZ5h7dG1f1+X206azZihfWGUl8W8608O8h
 W6WmEm7Ll7ajr0Di7wEzXZiskmQXtIzAGKh7CVeYpQ/0UfvF6LC+c2N5yulkcFXABKSx
 i9IA==
X-Gm-Message-State: AOAM5327iXfxK+nZ0LQCDVxQB1FpjwQIdW4b8dRT+aeyBCRvxQrdAGI5
 ab9u0cdNPknepozg+VWxl06uC8hPl2BKQg==
X-Google-Smtp-Source: ABdhPJyfWmxhkH1IA4NxqFHIOul9JxnZQCQu1y3miRlYPE/Ny2zthirr1eWHuQI8jm8AMXKvu4y5/w==
X-Received: by 2002:a17:902:9a4c:b029:119:d507:dccd with SMTP id
 x12-20020a1709029a4cb0290119d507dccdmr8856951plv.55.1624101680959; 
 Sat, 19 Jun 2021 04:21:20 -0700 (PDT)
Received: from [192.168.1.153] (87.19.178.217.shared.user.transix.jp.
 [217.178.19.87])
 by smtp.gmail.com with ESMTPSA id z15sm12255218pgu.71.2021.06.19.04.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 04:21:20 -0700 (PDT)
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Subject: [PATCH v2 0/5] riscv: improving uaccess with logs from network bench
Message-ID: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
Date: Sat, 19 Jun 2021 20:21:17 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_042123_045166_F5DF4939 
X-CRM114-Status: GOOD (  10.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T3B0aW1pemluZyBjb3B5X3RvX3VzZXIgYW5kIGNvcHlfZnJvbV91c2VyLgoKSSByZXdyb3RlIHRo
ZSBmdW5jdGlvbnMgaW4gdjIsIGhlYXZpbHkgaW5mbHVlbmNlZCBieSBHYXJyeSdzIG1lbWNweQpm
dW5jdGlvbiBbMV0uClRoZSBmdW5jdGlvbnMgbXVzdCBiZSB3cml0dGVuIGluIGFzc2VtYmxlciB0
byBoYW5kbGUgcGFnZSBmYXVsdHMgbWFudWFsbHkKaW5zaWRlIHRoZSBmdW5jdGlvbi4KCldpdGgg
dGhlIGNoYW5nZXMsIGltcHJvdmVzIGluIHRoZSBwZXJjZW50YWdlIHVzYWdlIGFuZCBzb21lIHBl
cmZvcm1hbmNlCm9mIG5ldHdvcmsgc3BlZWQgaW4gVURQIHBhY2tldHMuCk9ubHkgcGF0Y2hpbmcg
Y29weV91c2VyLiBVc2luZyB0aGUgb3JpZ2luYWwgbWVtY3B5LgoKQWxsIHJlc3VsdHMgYXJlIGZy
b20gdGhlIHNhbWUgYmFzZSBrZXJuZWwsIHNhbWUgcm9vdGZzIGFuZCBzYW1lCkJlYWdsZVYgYmV0
YSBib2FyZC4KCkNvbXBhcmlzb24gYnkgInBlcmYgdG9wIC1VZSB0YXNrLWNsb2NrIiB3aGlsZSBy
dW5uaW5nIGlwZXJmMy4KCi0tLSBUQ1AgcmVjdiAtLS0KIMKgKiBCZWZvcmUKIMKgIDQwLjQwJcKg
IFtrZXJuZWxdwqAgW2tdIG1lbWNweQogwqAgMzMuMDklwqAgW2tlcm5lbF3CoCBba10gX19hc21f
Y29weV90b191c2VyCiDCoCogQWZ0ZXIKIMKgIDUwLjM1JcKgIFtrZXJuZWxdwqAgW2tdIG1lbWNw
eQogwqAgMTMuNzYlwqAgW2tlcm5lbF3CoCBba10gX19hc21fY29weV90b191c2VyCgotLS0gVENQ
IHNlbmQgLS0tCiDCoCogQmVmb3JlCiDCoCAxOS45NiXCoCBba2VybmVsXcKgIFtrXSBtZW1jcHkK
IMKgwqAgOS44NCXCoCBba2VybmVsXcKgIFtrXSBfX2FzbV9jb3B5X3RvX3VzZXIKIMKgKiBBZnRl
cgogwqAgMTQuMjclwqAgW2tlcm5lbF3CoCBba10gbWVtY3B5CiDCoMKgIDcuMzclwqAgW2tlcm5l
bF3CoCBba10gX19hc21fY29weV90b191c2VyCgotLS0gVURQIHNlbmQgLS0tCiDCoCogQmVmb3Jl
CiDCoCAyNS4xOCXCoCBba2VybmVsXcKgIFtrXSBtZW1jcHkKIMKgIDIyLjUwJcKgIFtrZXJuZWxd
wqAgW2tdIF9fYXNtX2NvcHlfdG9fdXNlcgogwqAqIEFmdGVyCiDCoCAyOC45MCXCoCBba2VybmVs
XcKgIFtrXSBtZW1jcHkKIMKgwqAgOS40OSXCoCBba2VybmVsXcKgIFtrXSBfX2FzbV9jb3B5X3Rv
X3VzZXIKCi0tLSBVRFAgcmVjdiAtLS0KIMKgKiBCZWZvcmUKIMKgIDQ0LjQ1JcKgIFtrZXJuZWxd
wqAgW2tdIG1lbWNweQogwqAgMzEuMDQlwqAgW2tlcm5lbF3CoCBba10gX19hc21fY29weV90b191
c2VyCiDCoCogQWZ0ZXIKIMKgIDU1LjYyJcKgIFtrZXJuZWxdwqAgW2tdIG1lbWNweQogwqAgMTEu
MjIlwqAgW2tlcm5lbF3CoCBba10gX19hc21fY29weV90b191c2VyCgpQcm9jZXNzaW5nIG5ldHdv
cmsgcGFja2V0cyByZXF1aXJlIGEgbG90IG9mIHVuYWxpZ25lZCBhY2Nlc3MgZm9yIHRoZSBwYWNr
ZXQKaGVhZGVyLCB3aGljaCBpcyBub3QgYWJsZSB0byBjaGFuZ2UgdGhlIGRlc2lnbiBvZiB0aGUg
aGVhZGVyIGZvcm1hdCB0byBiZQphbGlnbmVkLgpBbmQgdXNlciBhcHBsaWNhdGlvbnMgY2FsbCBz
eXN0ZW0gY2FsbHMgd2l0aCBhIGxhcmdlIGJ1ZmZlciBmb3Igc2VuZC9yZWNmKCkKYW5kIHNlbmR0
by9yZWN2ZnJvbSgpIHRvIHJlcGVhdCBsZXNzIGZ1bmN0aW9uIGNhbGxzIGZvciB0aGUgb3B0aW1p
emF0aW9uLgoKdjEgLT4gdjI6Ci0gQWRkZWQgc2hpZnQgY29weQotIFNlcGFyYXRlZCBwYXRjaGVz
IGZvciByZWFkYWJpbGl0eSBvZiBjaGFuZ2VzIGluIGFzc2VtYmxlcgotIFVzaW5nIHBlcmYgcmVz
dWx0cwoKWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIxLzIvMTYvNzc4CgpBa2lyYSBUc3Vr
YW1vdG8gKDUpOgogwqAgcmlzY3Y6IF9fYXNtX3RvL2NvcHlfZnJvbV91c2VyOiBkZWxldGUgZXhp
c3RpbmcgY29kZQogwqAgcmlzY3Y6IF9fYXNtX3RvL2NvcHlfZnJvbV91c2VyOiBBZGRpbmcgYnl0
ZSBjb3B5IGZpcnN0CiDCoCByaXNjdjogX19hc21fdG8vY29weV9mcm9tX3VzZXI6IENvcHkgdW50
aWwgZHN0IGlzIGFsaWduZWQgYWRkcmVzcwogwqAgcmlzY3Y6IF9fYXNtX3RvL2NvcHlfZnJvbV91
c2VyOiBCdWxrIGNvcHkgd2hpbGUgc2hpZnRpbmcgbWlzYWxpZ25lZAogwqDCoMKgIGRhdGEKIMKg
IHJpc2N2OiBfX2FzbV90by9jb3B5X2Zyb21fdXNlcjogQnVsayBjb3B5IHdoZW4gYm90aCBzcmMg
ZHN0IGFyZQogwqDCoMKgIGFsaWduZWQKCiDCoGFyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUyB8IDE4
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIMKgMSBmaWxlIGNoYW5n
ZWQsIDE0NiBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

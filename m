Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB5AC04EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 13:19:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 976DD20866
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 13:19:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="InE4SJnn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATydPUtC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 976DD20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KrWysVCelFqN2ZSCGmO0WDZQztElGrUAmCLlHM79EyI=; b=InE4SJnnxz+MT64VIkApOc8BO
	OejsN7M4apSA/x3fOsCCc1OpXm1DF8aeHJPQbsP2369UruIoNAGZU2ueypWF2eROQQ+CCXVK/vdIp
	abiW5t+sL9WlyNhTarYMLEDk/HYjNECYHaoJpwgLjKBmugpj41q0b1IfADF6AfSO96DuGadtnNABu
	+n4fCK5GgBQgudnRoaRxR46e11194FORXCzaKgz6TjobBnNdESvNi2XvQCjgxjKMMQJhh//hjAtC+
	Zlrav4+dmaLHdWIN/j54KDVMtnQn1dUKO964Uy8lwyMN8sD9Wis0P0jA3/QqZ2iIR9GMFK2kMVGTF
	7LX5R7zVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCPFf-0003GT-7y; Tue, 16 Oct 2018 13:19:11 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCPFY-0003FI-3k
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 13:19:09 +0000
Received: by mail-pl1-x641.google.com with SMTP id y11-v6so11022542plt.3
 for <linux-riscv@lists.infradead.org>; Tue, 16 Oct 2018 06:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D+6TdobHyMDoqnPD/fyBYAMZHWiZnq2AtaxEKyjpQzk=;
 b=ATydPUtCKNoqYjpuYfyDZM+RszZ58aFrFzB9VdwMdUhlctlfnDtYdTKcLCevfmjERx
 7N+6CcPRheM8nAuaUQ4gGiLJ9AvzW6Sz0vNEGLUHNiUnF4y2A10kv/Ai2oQCq1oKZ44C
 WZh/qO1YOMwYzswGqLzzMX+bExjJYVdhyBHIR8wmaZ946iyWFDG/AcF7psPZgkan3Ldj
 gzJ44zzMRzis2RFxDychcnkiqdeGW14wbmS4KiHYRqv+OJSleHwqgd0NxYhngmpmxUEe
 B0qsFtr1cTrgUi66YTWWOeG2ScoRjBcrvIl9njREwmYwMxbwsdMgESxiRMF+3IcFvlm5
 Niiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D+6TdobHyMDoqnPD/fyBYAMZHWiZnq2AtaxEKyjpQzk=;
 b=FWeFNWNHPbIKzHayHRAPgd3YZ3mn+ALbfhYO8ccnf6uwC1Cykaa/QStoQeoOig225F
 PF74cVDM+/4bKHAIWrLlpdDY0aHZtsQ+vKGBBobKveih/WRICX/Uuw2cxCB7pqWLBRs9
 7gVAJz/PRDoKEfibhVeJFjhFwRR+kPytKPK+lbhy5RM1iInUI4X+7ZG2DdVVlxcaG0RG
 TsWFK7v2dA2dtWslMpaL4CcXZQoRB3B8FDyEXw8FVMF6Y/Vfts6lvMVtyX4hGAnTrEvE
 1zkO04EYNQMbQvxXOgj/M5eZY20nd2w0dWQzyqc+TwvgQU5CNU08fuc9I80FeTj4dr5i
 NAJg==
X-Gm-Message-State: ABuFfogs47D8RQiLOVnmCfBC3SCACD45YAdBaaAfgJhPo+BBhRzW0EkK
 1lr632alUHZwho8AxcI+JXk=
X-Google-Smtp-Source: ACcGV627zspK/clCeq1QePjnbqayfmfFiUsyyLrILKQHvqHoatCKifWOk8x41d3ZQj7HTOR+otWTpg==
X-Received: by 2002:a17:902:5e3:: with SMTP id
 f90-v6mr21154995plf.222.1539695932747; 
 Tue, 16 Oct 2018 06:18:52 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id z15-v6sm17469646pfn.170.2018.10.16.06.18.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Oct 2018 06:18:51 -0700 (PDT)
Subject: Re: [PATCH v8 3/5] Cleanup ISA string setting
To: Palmer Dabbelt <palmer@sifive.com>, alankao@andestech.com
References: <mhng-48e07863-dd56-4ef6-8342-aa19414bc1b8@palmer-si-x1c4>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <fc881ae2-4803-5859-f9c1-52f1a1381f6f@roeck-us.net>
Date: Tue, 16 Oct 2018 06:18:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mhng-48e07863-dd56-4ef6-8342-aa19414bc1b8@palmer-si-x1c4>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_061904_221918_CB5973FE 
X-CRM114-Status: GOOD (  16.53  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: vincentc@andestech.com, nickhu@andestech.com, greentime@andestech.com,
 linux-kernel@vger.kernel.org, zong@andestech.com,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016131849._eBL2VV9Z_avyFu-9PSivYexAGh9M6nR1PvIXFgTqJ0@z>

T24gMTAvMTUvMjAxOCAwMzozNCBQTSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gU3VuLCAx
NCBPY3QgMjAxOCAxNjo0Njo0MCBQRFQgKC0wNzAwKSwgYWxhbmthb0BhbmRlc3RlY2guY29tIHdy
b3RlOgo+PiBIaSBHdWVudGVyLAo+Pgo+PiBPbiBTYXQsIE9jdCAxMywgMjAxOCBhdCAwNTowMjow
NVBNIC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gV2l0aCB0aGlz
IHBhdGNoIGluIC1uZXh0IGFwcGxpZWQsIEkgZ2V0IHRoZSBmb2xsb3dpbmcgZXJyb3IKPj4+IHdo
ZW4gYnVpbGRpbmcgcmlzY3Y6ZGVmY29uZmlnLgo+Pgo+PiBJIGd1ZXNzIHdoYXQgeW91IG1lYW50
IHdhcyB0aGlzIGNvbW1pdDoKPj4gY29tbWl0IDBhNWJlZTA1ZmM2N2NlMjA0NGI4ZDkxYTE4YWJi
ZjE0MDQyZGE1MzEKPj4KPj4gVGhlIG1vZGlmaWNhdGlvbiBpbiBNYWtlZmlsZSB3YXMKPj4KPj4g
LWVuZGlmCj4+IC0KPj4gLUtCVUlMRF9BRkxBR1MgKz0gLW1hcmNoPSQoS0JVSUxEX01BUkNIKSQo
S0JVSUxEX0FSQ0hfQSlmZCQoS0JVSUxEX0FSQ0hfQykKPj4gKyMgSVNBIHN0cmluZyBzZXR0aW5n
Cj4+ICtyaXNjdi1tYXJjaC0kKENPTkZJR19BUkNIX1JWMzJJKcKgwqDCoMKgwqDCoCA6PSBydjMy
aW0KPj4gK3Jpc2N2LW1hcmNoLSQoQ09ORklHX0FSQ0hfUlY2NEkpwqDCoMKgwqDCoMKgIDo9IHJ2
NjRpbQo+PiArcmlzY3YtbWFyY2gtJChDT05GSUdfUklTQ1ZfSVNBX0EpwqDCoMKgwqDCoCA6PSAk
KHJpc2N2LW1hcmNoLXkpYQo+PiArcmlzY3YtbWFyY2gtecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDo9IGZkCj4+ICtyaXNjdi1tYXJjaC0kKENPTkZJ
R19SSVNDVl9JU0FfQynCoMKgwqDCoMKgIDo9ICQocmlzY3YtbWFyY2gteSljCj4+Cj4+IGFuZCB0
aGUgIjo9IGZkIiBsaW5lIHdhcyB3cm9uZy7CoCBJdCBzaG91bGQgaGF2ZSBiZWVuCj4+Cj4+ICty
aXNjdi1tYXJjaC15wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgOj0gJChyaXNjdi1tYXJjaC15KWZkCj4+Cj4+Pgo+Pj4KPj4+IFdoYXQgYW0gSSBtaXNz
aW5nID8gRG9lcyBSSVNDLVYgbm93IHJlcXVpcmUgYSBuZXcgbm9uLXVwc3RyZWFtIGNvbXBpbGVy
ID8KPj4+IE9yIGEgc3BlY2lhbCB2ZXJzaW9uIG9mIG1ha2UgPyBJIGFtIGN1cnJlbnRseSB1c2lu
ZyBHTlUgTWFrZSA0LjEuCj4+Cj4+IFNvIEkgc2VudCB0aGUgdjggdG8gZml4IHRoaXMgcHJvYmxl
bS4KPj4gU29ycnkgZm9yIHRoZSBpbmNvbnZpbmllbmNlLgo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+
IEd1ZW50ZXIKPj4+Cj4+PiAtLS0KPj4KPj4gQW5kIFBhbG1lciwgaXQgc2VlbXMgdGhhdCB0aGUg
cGF0Y2ggdGhhdCBjYXVzZXMgdGhpcyBidWlsZCBlcnJvciBoYXMgYmVlbgo+PiBwdWxsZWQgaW50
byBsaW51eC1uZXh0LsKgIEFueSBpZGVhIGhvdyB0byBmaXggdGhhdCBvbmU/Cj4gCj4gSWYgSSBy
dW4gaW50byB0aGUgbmV3IHZlcnNpb24gdGhlbiBJJ2xsIG92ZXJ3cml0ZSBpbiBpbiBteSBmb3It
bmV4dCBicmFuY2guwqAgSSBkb24ndCBzZWUgb25lLCB0aG91Z2guLi4KPiAKClRoZSBzZXJpZXMg
aXMgb24gbG9yZSwgbGttbCwgYW5kIHBhdGNod29yay4gUGF0Y2h3b3JrIGxpbmsgdG8gdjggb2Yg
dGhpcyBwYXRjaDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC85OTc0
MDcvCgpHdWVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==

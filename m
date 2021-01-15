Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F66C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 02:33:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 232F923AFC
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 02:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 232F923AFC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Mime-Version:Message-ID:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=P1UxIJU0zmKRSl/MkQxQb4YyrkWhCW8pB2m0FraT6nU=; b=1QjbcsuvUML2HIy+wPt1/E20O
	eY+gkrGPLkJ/oUMnUqZVpcH4ACWNU3RraoiXkNswJG7UWJSm7Pj+TAoZX7qoI3xgedE/sQB3eLVX8
	+wctNspbjW+J4CYD0p9QF5mgf0Nd2se670SZLF6Pe4284bUuCDls/qEXThcJajoQ+TX95iEiEV6xE
	ef9+QvYTEfRVuDvcA4AbB87DvAetcIcP62V+nL5/xYhNRWJRkAOV8+i8kNcPzmwYrY6IRs8hIUN7n
	lTS1N8ttsonK9rrB5pdc971+P+Ioz1L6VOg2WH7KVFmaA2PhxMAbazA5AyyxQ3QZ46XgBYKZ3VoKR
	rRefT9b3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0EvD-0000C7-Sg; Fri, 15 Jan 2021 02:33:07 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0EvB-0000B7-3I
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 02:33:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id x12so3924454plr.10
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 18:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Pz6Y6vOK6RaxYz6xJR6YBEMao4wNKdw19rDXAhfpNn0=;
 b=oHnTm1rta6c1kGZy5itQoYICHlCJ3RpMyE0qbOwrkdmVUHPyE0QbVZYXn76ujs+Qif
 pi4z6AorBL+kC3yg7zWmebkqPCmXaQwDi3lVCeloTHMlDLIya113mnbO7EcUonYI4tNN
 nYEss2bhjG7NCGUWwmlbZRZg2W0zFAEJrtLTXtw1J1zWfvksKb5uF+5K4X39LcK5A+uu
 Vl2VNz2xua0mgiAe/0fjsoVATcrF+R3+D6h1K+FstIIRqOyKB1iUHJrq0HraahQRrKqP
 /Edk7IE+2SAqZtZbJ8P1q22P//w9emb1pYcfqWFvKxhXWYH0iEh8czFkNjd5AetVaEed
 Gb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Pz6Y6vOK6RaxYz6xJR6YBEMao4wNKdw19rDXAhfpNn0=;
 b=Papg93/qRBqGOhv6glptuFv/peuZk8klf1+VhUS7FxaEXIoGmfHVQK3FRjdWOY+UFI
 X0Mej5J6mHlnBQ6OjsgGciMbV24YwFV51GIi+kvJ7DSl7NrkTpby/ZI+Vw/QmG5zO6SS
 jy1GBmgr+NG/5ixP5wJZf1J0NWfzsAQ4AEKOxOs7IGC3zPBp/W3/RRJdoOXl0jZitfJm
 tP1EKM+KvaH6TKnmurFREyvFs5NYt26ohBs+Kk7zDLr0XuScRK9cxO53KzzQfjILDFnA
 kxjia1meJ+WBjEDCu9uDdiRQ40PAXH2XBCsbNVeWxZGcrBkS1+5Htj1srTLRF+LVlo+U
 Z11g==
X-Gm-Message-State: AOAM531S6cfNY5o5ttNaPdvl9N9nSUPWwpK8Mk1Up872BGn5lpk/U+g9
 PDLD9tgaMU08ZDbgIzg8mF2Stv8K2Cx2Gw==
X-Google-Smtp-Source: ABdhPJzAlSLiQuXFPCErk5RSo87l5Od2RduYfNZB8h8j8lOON0fA5K4vIRy0mFsZ6hW/rYz0H+zhlg==
X-Received: by 2002:a17:90a:a60f:: with SMTP id
 c15mr8365100pjq.53.1610677982303; 
 Thu, 14 Jan 2021 18:33:02 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u25sm6495428pfn.170.2021.01.14.18.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 18:33:01 -0800 (PST)
Date: Thu, 14 Jan 2021 18:33:01 -0800 (PST)
X-Google-Original-Date: Thu, 14 Jan 2021 18:32:04 PST (-0800)
Subject: Re: [PATCH] riscv: stacktrace: Move register keyword to beginning of
 declaration
In-Reply-To: <20210114024657.194363-1-wangkefeng.wang@huawei.com>
Message-ID: <mhng-e6599a1f-4333-4264-ae45-a1363145556b@penguin>
Mime-Version: 1.0 (MHng)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_213305_168939_41FAE21A 
X-CRM114-Status: GOOD (  18.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 wangkefeng.wang@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxMyBKYW4gMjAyMSAxODo0Njo1NyBQU1QgKC0wODAwKSwgd2FuZ2tlZmVuZy53YW5n
QGh1YXdlaS5jb20gd3JvdGU6Cj4gVXNpbmcgZ2xvYmFsIHNwX2luX2dsb2JhbCBkaXJlY3RseSB0
byBmaXggdGhlIGZvbGxvd2luZyB3YXJuaW5nLAo+Cj4gYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0
cmFjZS5jOjMxOjM6IHdhcm5pbmc6IOKAmHJlZ2lzdGVy4oCZIGlzIG5vdCBhdCBiZWdpbm5pbmcg
b2YgZGVjbGFyYXRpb24gWy1Xb2xkLXN0eWxlLWRlY2xhcmF0aW9uXQo+IDMxIHwgICBjb25zdCBy
ZWdpc3RlciB1bnNpZ25lZCBsb25nIGN1cnJlbnRfc3AgPSBzcF9pbl9nbG9iYWw7Cj4gICAgfCAg
IF5+fn5+Cj4KPiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1
YXdlaS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYyB8IDUgKyst
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zdGFja3RyYWNlLmMKPiBpbmRleCA0OGI4NzBhNjg1YjMuLmRmNWQyZGE3YzQwYiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMKPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMKPiBAQCAtMTQsNyArMTQsNyBAQAo+Cj4gICNpbmNs
dWRlIDxhc20vc3RhY2t0cmFjZS5oPgo+Cj4gLXJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgc3BfaW5f
Z2xvYmFsIF9fYXNtX18oInNwIik7Cj4gK3JlZ2lzdGVyIGNvbnN0IHVuc2lnbmVkIGxvbmcgc3Bf
aW5fZ2xvYmFsIF9fYXNtX18oInNwIik7Cj4KPiAgI2lmZGVmIENPTkZJR19GUkFNRV9QT0lOVEVS
Cj4KPiBAQCAtMjgsOSArMjgsOCBAQCB2b2lkIG5vdHJhY2Ugd2Fsa19zdGFja2ZyYW1lKHN0cnVj
dCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4gIAkJc3AgPSB1c2Vy
X3N0YWNrX3BvaW50ZXIocmVncyk7Cj4gIAkJcGMgPSBpbnN0cnVjdGlvbl9wb2ludGVyKHJlZ3Mp
Owo+ICAJfSBlbHNlIGlmICh0YXNrID09IE5VTEwgfHwgdGFzayA9PSBjdXJyZW50KSB7Cj4gLQkJ
Y29uc3QgcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBjdXJyZW50X3NwID0gc3BfaW5fZ2xvYmFsOwo+
ICAJCWZwID0gKHVuc2lnbmVkIGxvbmcpX19idWlsdGluX2ZyYW1lX2FkZHJlc3MoMCk7Cj4gLQkJ
c3AgPSBjdXJyZW50X3NwOwo+ICsJCXNwID0gc3BfaW5fZ2xvYmFsOwo+ICAJCXBjID0gKHVuc2ln
bmVkIGxvbmcpd2Fsa19zdGFja2ZyYW1lOwo+ICAJfSBlbHNlIHsKPiAgCQkvKiB0YXNrIGJsb2Nr
ZWQgaW4gX19zd2l0Y2hfdG8gKi8KClRoYW5rcywgdGhpcyBpcyBvbiBmaXhlcy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

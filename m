Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EB2C77B7D
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 02:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSOD0eK4frDMOx2RuOqcv0uKSUv/PvlP0D6C1uUi8Ak=; b=Z1fykZ+0MqKO2M
	pirKLQU+jLxuWBKOZoDTe9msXeXhiYOM2i0OB6JI+APDNk0nvn2JQugt8A7eXdPg3o/YVT9Tytte1
	q2dYFZRPJnzQjE6L+IHgF+jugTFdpLM2JE7rrv3Lg2ga52/9XsqdXKF3jQJ8IxuobEhbgJ1rLuHMO
	iqK2BMF9Mre7pKS14JMRdBAE/ANoHamqt4xYZozpDOOgX03sc/n0C921qlS7LSOXrqt0FqgqlmqjR
	mkA3zQQgVpei9EZ0K9Ry9BQuVCfpBWvqv/0Z0nir3RoEtbiOQK3+ecrPWNX2BAK56Mw0k49qQw4Ut
	e6uSmvZ5fJLGiLkzH7Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pykDv-0047Bc-1v;
	Tue, 16 May 2023 02:15:35 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pykDs-00478x-2e
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 02:15:34 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50b37f3e664so23785629a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 May 2023 19:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684203322; x=1686795322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmW4rabBYGrMSrHrIlKazVNo/yNKOJy3JS8TSLBbtz4=;
        b=q/7kGUoDV6jPUAnaUAD8AFodgiIpFhPxxb8bNLKAtuWEPuqG0pRtqDyKin1DRYTDPw
         zzjI7qYpa+MD/EompqjcvKijttlEsPdg+r1d1LqSyeoQCw5UsPtQkw0f3/cbeFfH1OJJ
         PmKOxozSac3SSiMCDZgQpQu/4b3XaQ4gY4MZucHZIVsckCENfsN+sZbAPZWXzcStiYZ3
         Xxt2JBhCoTaZh6wgHFE5cfInLyvLDWXT6Un1g5NCx5Mv7+zCpZuYTnTPvEdBnwtzHRo1
         Wr1RaHvdVMMMjKqZiabJ9iLlIPldzKx1ZD1ilO11cKaOogpPrmYEHs0PJAz3YO4+rmg/
         2sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684203322; x=1686795322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmW4rabBYGrMSrHrIlKazVNo/yNKOJy3JS8TSLBbtz4=;
        b=ZjEh9Dn6mR2+zzptLocM4ktu2Rn2hfQx4gLFnX6JKHdHyY1m2xQGNT1apYKFmAA10C
         WdXYm6C5GZeGGvkeqvx5JStV+a2qRZWy0p7Mgxy21kSCU8Ih6plu+8vN6ZJqNB5Qsmm3
         uTL8eUVsWrsrLr7piKFxDEGwhpVy9zhzMy4HVJfGMoLp49WaZhGI29JKC8/OuzPuTzmx
         z0s1D2QZcJGIz+RoG5z1nuQPg8AlF1zwQBpOTpc+CG3aAM8zbXODdrHeYBKzaKezYuJ0
         vID66Xq+80jzioazD/sW/KnjLnNmpcO3ixz7i77PMnyEWohL6EhOHqmWGMRytKmiV1Z3
         /2dg==
X-Gm-Message-State: AC+VfDzNSegQ+dFaqtTNIYx+dIoCz/7NRqIfuUc99rmZV/5zKQG3Ba+z
	09EMkkOq+K1WWkEdaSFN2d5mt3iLISc6M0MEf3Y=
X-Google-Smtp-Source: ACHHUZ6WpGxo89XbVz24EcEbkD79WtRYrkDbyrCA7iw4I6kcAocQKjbzMSdKhMYlo/1DXkSMhnaAcD6Z10qA7QC6dJU=
X-Received: by 2002:aa7:d88f:0:b0:50b:c1e3:6f02 with SMTP id
 u15-20020aa7d88f000000b0050bc1e36f02mr28022210edq.21.1684203321686; Mon, 15
 May 2023 19:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230515031314.7836-1-zegao@tencent.com> <20230515-dominion-botch-e0b9291bcea3@spud>
In-Reply-To: <20230515-dominion-botch-e0b9291bcea3@spud>
From: Ze Gao <zegao2021@gmail.com>
Date: Tue, 16 May 2023 10:15:10 +0800
Message-ID: <CAD8CoPBi0OwWbFzfACvLw0EiC14E_QtsssV4UP7KJctsOmAa-w@mail.gmail.com>
Subject: Re: [PATCH 0/4] Make fpobe + rethook immune to recursion
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ze Gao <zegao@tencent.com>, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_191532_858319_D4507E55 
X-CRM114-Status: GOOD (  14.68  )
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

SGkgQ29ub3IsClNvcnJ5IGZvciBtYWtpbmcgc3VjaCBtaXN0YWtlcywgIGl0J3MgbXkgZ2l0LS1z
ZW5kLWVtYWlsIHNlbmRpbmcKc2NyaXB0IHRoYXQgZG9lcyBub3Qgd29yayB3ZWxsLgpJJ2xsIHNl
bmQgdjIgYW5kIGRvdWJsZS1jaGVjayB0aGUgY2MtbGlzdCBBU0FQLgoKUmVnYXJkcywKWmUKCk9u
IFR1ZSwgTWF5IDE2LCAyMDIzIGF0IDE6NDTigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMTUsIDIwMjMgYXQgMTE6MTM6MDlBTSArMDgw
MCwgWmUgR2FvIHdyb3RlOgo+ID4gQ3VycmVudCBmcHJvYmUgYW5kIHJldGhvb2sgaGFzIHNvbWUg
cGl0ZmFsbHMgYW5kIG1heSBpbnRyb2R1Y2Uga2VybmVsIHN0YWNrIHJlY3VzaW9uLCBlc3BlY2lh
bGx5IGluCj4gPiBtYXNzaXZlIHRyYWNpbmcgc2NlbmFyaW8uCj4gPgo+ID4gRm9yIGV4YW1wbGUs
IGlmIChERUJVR19QUkVFTVBUIHwgVFJBQ0VfUFJFRU1QVF9UT0dHTEUpICwgcHJlZW1wdF9jb3Vu
dF97YWRkLCBzdWJ9IGNhbiBiZSB0cmFjZWQgdmlhCj4gPiBmdHJhY2UsIGlmIHdlIGhhcHBlbnMg
dG8gdXNlIGZwcm9iZSArIHJldGhvb2sgYmFzZWQgb24gZnRyYWNlIHRvIGhvb2sgb24gdGhvc2Ug
ZnVuY3Rpb25zLAo+ID4gcmVjdXJzaW9uIGlzIGludHJvZHVjZWQgaW4gZnVuY3Rpb25zIGxpa2Ug
cmV0aG9va190cmFtcG9saW5lX2hhbmRsZXIgYW5kIGxlYWRzIHRvIGtlcm5lbCBjcmFzaAo+ID4g
YmVjYXVzZSBvZiBzdGFjayBvdmVyZmxvdy4KPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGEgYml0
IGNvbmZ1c2luZy4gVGhlIFJJU0MtViBsaXN0IGdvdCAyIGNvdmVyIGxldHRlcnMKPiBhbmQgMiBw
YXRjaCA0cywgYnV0IG5vdCBhbnkgb2YgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcy4gUGxlYXNlIGF0
IGxlYXN0Cj4gc2VuZCB0aGUgd2hvbGUgc2VyaWVzIHRvIHRoZSBsaXN0IHNvIG91ciBwYXRjaHdv
cmsgYXV0b21hdGlvbiBjYW4gYmUgcnVuCj4gYWdhaW5zdCBpdC4gQW5kIG1hcmsgaXQgYXMgdjIg
d2hpbGUgeW91IGFyZSBhdCBpdC4KPgo+IFRoYW5rcywKPiBDb25vci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

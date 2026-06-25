Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF69ACDE00C
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 23:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXX8MVUVcMdaXBpIOkw0q6R1Dkkh5T4ZtsT4uLLjLr8=; b=O7SLuOd1vX6U4I
	6Qz5Mtqlq8zw0t9E1wbaB9lLf6f5WaH4qutrWtVHKFWQkhpeXxl+Gh1zok8pZb6oB++fFG2nWaUGO
	oVFWXirxmCiBwhwD6mkvtFbSM6fPk60+INZJ6DYdZlBYvk5XcH1p3Ec+ebSt2jDr7IAUWp+Uq1iGI
	5FNoMLehzctvpMjyTuAOeq1echMEbE2TboWN7ohYjA0HkZSqbPdW4P7cuCYC31t+afX/aVwCykpTM
	qgZQwnCC2Rx8eHkwfVXFcwWujDg+OQ3EHRcQTkNrf/VAlPDlQXV7NNHkk9rVaiAcEoYDxfF5XrkLW
	mtAyNIG5ewwxbCbJtdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wctKL-00000009yxa-2Un3;
	Thu, 25 Jun 2026 23:17:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wctKI-00000009yx3-2BIT
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 23:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782429459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAy+D6+avzm5a1PUVxWkPHIj26RCUnmiZZV8qbgfM6I=;
	b=Ch9kuhorKmaZ7DvpAJ75X+Oefi0zqHW9nYXNJ1a1xZxRIRfRCecmky5ALP/dOPx2OQF+eQ
	TbEHcu++U7kiv/OiB5xDjkbqi5n9t0ux23/BnvWjpGYW7fqG1NAxVfutMGdUW+PxJGwB7g
	eEqyyO8/GjLCIGx9B54FD4mHY7NmlkM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-jLssP257O-erOuE9bAXGDg-1; Thu, 25 Jun 2026 19:17:37 -0400
X-MC-Unique: jLssP257O-erOuE9bAXGDg-1
X-Mimecast-MFC-AGG-ID: jLssP257O-erOuE9bAXGDg_1782429457
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157f453a27so60084985a.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jun 2026 16:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782429457; x=1783034257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RAy+D6+avzm5a1PUVxWkPHIj26RCUnmiZZV8qbgfM6I=;
        b=cPGOfkNxxFQKVAhqnuidsWzZRrdP++j1/ETr/6yJC/VNrzYqbzEiIdy/BIx3toOf6F
         JWuengaQTe8nlWRmdQUkO8ZSwVUcmotsTUGu8BHwmZkLPpaRfR1mPPzjzrnUvXnJHM+1
         zXTUmKvCJdG0mj1jmSJ0BjMz7xClI7iGeEYckGexmvQMzIhrvCc9kdfeq+Rx40AAK2eb
         6j7hj6nYj9nMS5PbgmV7wv4drUmcseUYKH3WFy0bC/gDiKtT+BvLVRG9YPON7tHMILlT
         jBnMwuv5SCQPyDG8xCK7DnmFriviVFM2YfroRSPF6oUessdGLpB1uuuZWqJ19UIUd5is
         6j3g==
X-Gm-Message-State: AOJu0Yzse4ETCYnALweflzds66jVxlnC9SCUnHNnDj+5V646rLwS1Ft9
	dttA93hsMN9o0Z0AIbftMjX3LUBPbK6VBPbkf47XTDncgRsBwiPTjYRL3wClARav9hfzupx8X7Y
	u928NTq7WYm1LphrYvf1r85OuSZOTqBnekBZfJ2FuPNk57jo4HKi6spJAtIjj15IhAOoehB7hdj
	UlIzrZ4lQpIPDDVpZXkYcqdn8+CVONrY6r7yF7C8gfp8Y6
X-Gm-Gg: AfdE7cmvcy1mkFEkZwPKx38IRNOk+5x8lKtRPYaByxMyO+r/5bewKRuP1bhcZuI36K5
	8LSilBZUAE4YWYCkAjOxW+8bNW0g4YYMIcS3XxtFc7pXsSou6DMQi+ezL53Eehd8JUx5FbAMgpG
	PH5hK2z9cXEpVubNpAJyM+xNH88JKuoeo3twr0xpZaY7l/qq0l6qdBHuihLYUSl131bew=
X-Received: by 2002:a05:620a:880a:b0:916:1612:17c8 with SMTP id af79cd13be357-9293abafba7mr694065085a.17.1782429457103;
        Thu, 25 Jun 2026 16:17:37 -0700 (PDT)
X-Received: by 2002:a05:620a:880a:b0:916:1612:17c8 with SMTP id
 af79cd13be357-9293abafba7mr694059985a.17.1782429456650; Thu, 25 Jun 2026
 16:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260529032739.13264-2-ltao@redhat.com>
In-Reply-To: <20260529032739.13264-2-ltao@redhat.com>
From: Tao Liu <ltao@redhat.com>
Date: Fri, 26 Jun 2026 11:17:00 +1200
X-Gm-Features: AVVi8CeWYorUiqbkZ6Mzg0X70ogp3F92WjduCj851owTgReUnHtxA0l143R7KbI
Message-ID: <CAO7dBbW+LEy8SBGAKcrxEDzK5Xctw-r7ztgnXuURa9g0xntbtQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix a NULL pointer reference in machine_kexec_prepare
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZvcRt_6xoISeC4z2-X-74duQaWdtBSlnvHgInvhqdSc_1782429457
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_161742_636405_EEEB821C 
X-CRM114-Status: GOOD (  14.79  )
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

S2luZGx5IHBpbmcsIGFueSBjb21tZW50cz8KClRoYW5rcywKVGFvIExpdQoKT24gRnJpLCBNYXkg
MjksIDIwMjYgYXQgMzozNeKAr1BNIFRhbyBMaXUgPGx0YW9AcmVkaGF0LmNvbT4gd3JvdGU6Cj4K
PiBBIE5VTEwgcG9pbnRlciByZWZlcmVuY2UgaXNzdWUgaXMgbm90aWNlZCBpbiByaXNjdidzIG1h
Y2hpbmVfa2V4ZWNfcHJlcGFyZSwKPiB3aGVyZSBpbWFnZS0+c2VnbWVudFtpXS5idWYgbWlnaHQg
YmUgTlVMTCBhbmQgY29waWVkIHVuY2hlY2tlZC4KPgo+IFRoZSBOVUxMIGJ1ZiBjb21lcyBmcm9t
IHNlY3VyaXR5L2ludGVncml0eS9pbWEvaW1hX2tleGVjLmM6Cj4gaW1hX2FkZF9rZXhlY19idWZm
ZXIoKSwgd2hlcmUga2J1ZiBpcyBhZGRlZCBieSBrZXhlY19hZGRfYnVmZmVyKCksCj4gYnV0IGti
dWYuYnVmZmVyIGlzIE5VTEwuCj4KPiBGaXggdGhpcyBieSBzaW1wbHkgYWRkaW5nIGEgY2hlY2sg
YmVmb3JlIGNvcHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUYW8gTGl1IDxsdGFvQHJlZGhhdC5jb20+
Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYyB8IDMgKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVj
LmMKPiBpbmRleCAyMzA2Y2UzZTVmMjIuLmQ4MWQ1NzZmOWNiNSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9t
YWNoaW5lX2tleGVjLmMKPiBAQCAtNDEsNiArNDEsOSBAQCBtYWNoaW5lX2tleGVjX3ByZXBhcmUo
c3RydWN0IGtpbWFnZSAqaW1hZ2UpCj4gICAgICAgICAgICAgICAgIGlmIChpbWFnZS0+c2VnbWVu
dFtpXS5tZW1zeiA8PSBzaXplb2YoZmR0KSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsKPgo+ICsgICAgICAgICAgICAgICBpZiAoaW1hZ2UtPnNlZ21lbnRbaV0uYnVmID09IE5V
TEwpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICAgICAgICAgICAg
ICAgICBpZiAoaW1hZ2UtPmZpbGVfbW9kZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBtZW1j
cHkoJmZkdCwgaW1hZ2UtPnNlZ21lbnRbaV0uYnVmLCBzaXplb2YoZmR0KSk7Cj4gICAgICAgICAg
ICAgICAgIGVsc2UgaWYgKGNvcHlfZnJvbV91c2VyKCZmZHQsIGltYWdlLT5zZWdtZW50W2ldLmJ1
Ziwgc2l6ZW9mKGZkdCkpKQo+IC0tCj4gMi40Ny4wCj4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

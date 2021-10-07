Return-Path: <SRS0=uA0y=O3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3137CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 07:02:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0B4F610C7
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 07:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0B4F610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I44eGyR1QjfjVDEH1gZiFLX3+gk0NzucR+azL+5nY+s=; b=cQkhRZPYbj5UVY
	VP9foGjpazr0PzZkPxo81JrF03oqw6nFfAh7bpc2cI1l+vGZwPubAEg/g1DNvwoTcK+SMM+ob0meO
	KO+/yOO+Qpt9fE/4lY3xGQoqdssuprFJdZLdlgVEYeQck0H/VaVbyvu5o3INySfT1KayCIZwZsY4f
	Xiw7YD8hy3CUKoNnoOeLmuVN1nZLZDuwcN+/LCkx5ZF8hHQWgF1bUMt7MKPanaLlVTS5tNb1IBQzY
	DlHdUXhku4L7wj4feI1Hsf0VvC0oX/VlH0TU4Kj8IkC0DRPg33Erdv/cpt/zvgJacHNRijvB3DdLv
	tBN///uOiSYPck0z3wyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNPM-00GLHM-VR; Thu, 07 Oct 2021 07:01:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNNP-00GKe3-IX
 for linux-riscv@lists.infradead.org; Thu, 07 Oct 2021 06:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633589972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5cjrtzAUfTFfn+XpMPFhZ+gWkuj4D+fj6EkUQIpFkA=;
 b=BHbwVFUNRbV7NvhEB8xN217d3wy53XGpBpXX/0Epo/vUNRpGn+iWzsQHcybre38dUr/Kkh
 oHXssekPAR57QJ5uius9DxptT85WzsSlZlul3kbCq26I0C6r6v+b6Im7G8iA+esk/Mo1hs
 283FsYrz9OYEG7wRFtx3CWJ64Nye50c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-llmvDe6lOI6vtjSI7rgN6w-1; Thu, 07 Oct 2021 02:59:31 -0400
X-MC-Unique: llmvDe6lOI6vtjSI7rgN6w-1
Received: by mail-ed1-f72.google.com with SMTP id
 v9-20020a50d849000000b003db459aa3f5so2379356edj.15
 for <linux-riscv@lists.infradead.org>; Wed, 06 Oct 2021 23:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r5cjrtzAUfTFfn+XpMPFhZ+gWkuj4D+fj6EkUQIpFkA=;
 b=PbqgNK/C30tagldDFvNz/9Qr7FeWs53ge9ciin/DY2cKp9LxMJ3xcJyZB52QgvxEXy
 +N9jO843UmmkvdpcZPsiVNJBrJEPFgaH5Yel8y8xQv39WKHEIIJMxoJ42GMJ4PgzYUQj
 MJ47qDSxmtXAlvijoNuJfCd0fwR2zVgSzJjD/C8JEErSxpZW/ui1yxY6waxSl+0261h4
 WNfQjef5y8TOUvtCeaWiF6iOTA26RJ1oZtvw/eOKDGthV+7zXJk+jt+QB7dxylQqFTQP
 2xnffmiIdUMikMtHlbpGhfK1XcUsdjDVq/MD8iHQA0hhEXV0W8nIMhhIx/PcP5mRkKjW
 tRXQ==
X-Gm-Message-State: AOAM531yiMr5P29AGCZsy/zJ3KGP4xiiEwlhI+Dd06xIYOFTrNJQv7ro
 Ag+qT9n/MOS2kNEADoUjT4SLQGf0V8U5+2hWs1rs0Roo1kaJPNV0gaoyXhZdKQ5FnRwmOQQFyII
 Gec2UL6mK/Z6zxDZ/4ibLJ3wIxB66
X-Received: by 2002:a05:6402:42d6:: with SMTP id
 i22mr1064359edc.54.1633589970258; 
 Wed, 06 Oct 2021 23:59:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsntpiI6uV8FdxmpZafdNUy/Hfb4zkESAWYNpyyJsdSRNJGc1JGMIgKJzRTW9DrB7PyWuUGg==
X-Received: by 2002:a05:6402:42d6:: with SMTP id
 i22mr1064336edc.54.1633589970018; 
 Wed, 06 Oct 2021 23:59:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id og39sm3195811ejc.93.2021.10.06.23.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 23:59:29 -0700 (PDT)
Message-ID: <42039591-c445-9298-607a-76efe875eb53@redhat.com>
Date: Thu, 7 Oct 2021 08:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [GIT PULL] KVM/riscv for 5.16
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: anup@brainfault.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <mhng-03b25a51-3491-4bb7-9e17-1b32fc97b7ff@palmerdabbelt-glaptop>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <mhng-03b25a51-3491-4bb7-9e17-1b32fc97b7ff@palmerdabbelt-glaptop>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_235935_738692_C0B358FF 
X-CRM114-Status: GOOD (  10.92  )
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

T24gMDYvMTAvMjEgMTg6NDIsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIFR1ZSwgMDUgT2N0
IDIwMjEgMDE6MjU6NDEgUERUICgtMDcwMCksIHBib256aW5pQHJlZGhhdC5jb20gd3JvdGU6Cj4+
IE9uIDA1LzEwLzIxIDA5OjU1LCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4gwqDCoCBnaXQ6Ly9naXRo
dWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3YtNS4xNi0xCj4+Cj4+IFB1
bGxlZCwgdGhhbmtzIQo+IAo+IFRoYW5rcyEKPiAKPiBJSVVDIGhvdyB0aGlzIGdlbmVyYWxseSB3
b3JrcyBpcyB0aGF0IHlvdSBwdWxsIHRoZXNlIEtWTS1zcGVjaWZpYyBwYXRjaCAKPiBzZXRzIGFu
ZCBJIGRvbid0LCB3aGljaCBtZWFucyB0aGV5J2xsIGdldCB0ZXN0ZWQgb24gbXkgZW5kIGFzIHRo
ZXkgbG9vcCAKPiBiYWNrIHRocm91Z2ggbGludXgtbmV4dC7CoCBJJ20gZmluZSB3aXRoIGhvd2V2
ZXIgdGhpcyB1c3VhbGx5IHdvcmtzLCBqdXN0IAo+IHRyeWluZyB0byBtYWtlIHN1cmUgd2UncmUg
b24gdGhlIHNhbWUgcGFnZSBhcyB0aGlzIGlzIG15IGZpcnN0IHRpbWUgCj4gYmVpbmcgdGhpcyBj
bG9zZSB0byBhbm90aGVyIHRyZWUuCgpHZW5lcmFsbHkgc3BlYWtpbmcsIEFudXAgYXMgdGhlIG1h
aW50YWluZXIgaXMgcmVzcG9uc2libGUgZm9yIHRoaW5ncyBub3QgCmJyZWFraW5nLiAgSSBkbyBh
IGNyb3NzLWNvbXBpbGUgdG8gY2hlY2sgYWdhaW5zdCBjaGFuZ2VzIHRvIEtWTSBjb21tb24gCmNv
ZGUgaW4gdmlydC9rdm0sIGJ1dCBvdGhlcndpc2UganVzdCB0YWtlIGhpcyB0cmVlIGFuZCBzZW5k
IGl0IG91dCB0byAKTGludXMuICBPbmNlIHNlbGZ0ZXN0cyBhcmUgaW4sIEkgd2lsbCBhbHNvIGJl
IGFibGUgdG8gcnVuIHRoZW0gdW5kZXIgClFFTVUsIGFnYWluIHRvIGNoZWNrIHRoYXQgY2hhbmdl
cyB0byB2aXJ0L2t2bS8gZG8gbm90IGJyZWFrIFJJU0MtVi4KClBhb2xvCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

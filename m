Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F3DC47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 11:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/W+/rpEAspSC4LFfWF4DTF2GnO9NpO0lE2LzeTYMOQ=; b=DvsO7kM7A5jTUU
	Yd004EjzGHU0MRiKgBrBJ76t3qke/BPRBfcv2ywqBLPHbicx9PJ2R//jld+5rfe0cNaCv/+kRtc0N
	0WTsLk/xqx2bCHpHEoNhFdtVleCgI3GO4N27+pJO3VqcPwEPYUij2f0mBUwkJMQVFE0b0zN5im9BS
	854u7vgYxixeUWJIosdpfc/TYFbena3i4lSvzbXn8GB8dUg3U2hFXZ6ZC605KwjqnB/jqZ/OU3oPR
	Iw6FhwGG7nNKJNPJ6kzRPHdpzmS0AOMDGUNnDH77sB6WliyZjTFYn5cGdlCCSAZvAp/UKqG/KsDPO
	VGK4+nq6D/wx1ic+OSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rndI4-00000006zn7-3N4R;
	Fri, 22 Mar 2024 11:42:28 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rndI2-00000006zlo-03oG;
	Fri, 22 Mar 2024 11:42:27 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-690bff9d4a6so12530206d6.1;
        Fri, 22 Mar 2024 04:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711107740; x=1711712540; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8evdBv9wfzyxMz+KpHh32wSrhwaXKbA+tqAPHK3l3vc=;
        b=Xrz9rbcVeXCZ2HgGWbFSGzqumKUyTVhEAYrV7ROQOeZXMS1sWPJ1TSES1azw4ItdoL
         eK39hMEmgzDRdfkmdU9atKg/w9XdKJJ87QDn2OE05Ym5aS/EW8l4vMZ3Rvd8rjvzIrhn
         pURMqQdc7FSr/43V6AS0sAfKLCEUdVtrvrcimHttz/nBbpJT/nNyVtGbROY1TJfr6sQ7
         CPSCbO8ubxm/Z5LuZM9kMHPrhUe669fcjhFVwhXiT3qDVbIIcmfNrE7mO3yye6aeptYv
         FIRVMcpqxY+4SEr+OsszlN76XHRPQCjWXhuYr3OHZ9r2D8E7eGbSNVWjHe3A+xUSDQ27
         m4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711107740; x=1711712540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8evdBv9wfzyxMz+KpHh32wSrhwaXKbA+tqAPHK3l3vc=;
        b=hJtWzXVmHRycuo3iO+2PFsDkvgJGctwnuC15zVCG/gpLNQ2w1ET931SJ/QpEef9r5e
         NHmYW7XbWbylFTNKTE8CQijWBhKJkq97Agf8kYk33/zYVQ5g6qopFggF6My7t/M1hoEk
         VrBmdz/ThTkj8KZLWZWAHp1ztekSWI8ZJXokOnYzwSu7Xmm+F/tJyQRTlM5VnzLEU2qi
         bPwbkYcJ61UUJNt6SuLryJGPKQhJ7SRBY1A3lpE7C9eoy7vXGZx0GgCBQERhE8tz1MWf
         0NUY5XLQ604OQF2r7yzrxxRAYijS96vFrhJbwnZQEvztpL0qnnZ394NXdHkpodr/ldei
         KLrg==
X-Forwarded-Encrypted: i=1; AJvYcCVisFUkhS2x6pqOYctzIE0pk91KE+azgtq6q1vRci9pBM1qI/PyR9CVOaVqM7sLp7UJQdHA6HIr9Q/pgKG4jMiC/gpk2w60DAKPU2zoJnei37u9xiu2fj3xO9I5bR+cXxyyoQn/55np4gzQj49bxw==
X-Gm-Message-State: AOJu0Yyx5tfQ9RKuMgptf3va88ntg+7vjAPKE+tjHerOY9T2TjTzpPKr
	H/9TuhR6ez9jYNWM0Tcg7cmbAJylydhxHSosePbV2gJmfJvvBuUq5HtFJYITy1WpWg==
X-Google-Smtp-Source: AGHT+IHYXA++eriMaFp3DVL8xL47iq28Kzs2KTpZk5Dga3q6r6IomxL2a7u8Kbi2GZjdsrCkllcNxQ==
X-Received: by 2002:a05:6358:4894:b0:17e:edfd:89bb with SMTP id pe20-20020a056358489400b0017eedfd89bbmr1963530rwc.15.1711107354301;
        Fri, 22 Mar 2024 04:35:54 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.27])
        by smtp.gmail.com with ESMTPSA id h190-20020a6383c7000000b005dc4fc80b21sm1382661pge.70.2024.03.22.04.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 04:35:53 -0700 (PDT)
Message-ID: <f44de7d9-e03d-483d-96d3-76c63158061d@gmail.com>
Date: Fri, 22 Mar 2024 19:35:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] KVM RISC-V APLIC fixes
To: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240321085041.1955293-1-apatel@ventanamicro.com>
From: Bing Fan <hptsfb@gmail.com>
In-Reply-To: <20240321085041.1955293-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_044226_082539_67FB7548 
X-CRM114-Status: UNSURE (   8.17  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CkhpLAoKCkFzIHlvdSBtZW50aW9uZWQgYXMgYmVsb3csIHJpc2N2J3MgYWlhIHBhdGNoIGluIApo
dHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKCldoeSBpcyB0aGlzIHNlcmllcyBv
ZiBwYXRjaGVzIG5vdCBtZXJnZWQgaW50byB1cHN0cmVhbT8KCgrlnKggMjAyNC8zLzIxIDE2OjUw
LCBBbnVwIFBhdGVsIOWGmemBkzoKPiBGZXcgZml4ZXMgZm9yIEtWTSBSSVNDLVYgaW4ta2VybmVs
IEFQTElDIGVtdWxhdGlvbiB3aGljaCB3ZXJlIGRpc2NvdmVyZWQKPiBkdXJpbmcgTGludXggQUlB
IGRyaXZlciBwYXRjaCByZXZpZXdzLgo+Cj4gVGhlc2UgcGF0Y2hlcyBjYW4gYWxzbyBiZSBmb3Vu
ZCBpbiB0aGUgcmlzY3Zfa3ZtX2FwbGljX2ZpeGVzX3YxCj4gYnJhbmNoIGF0OiBodHRwczovL2dp
dGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPgo+IEFudXAgUGF0ZWwgKDIpOgo+ICAgIFJJU0Mt
VjogS1ZNOiBGaXggQVBMSUMgc2V0aXBudW1fbGUvYmUgd3JpdGUgZW11bGF0aW9uCj4gICAgUklT
Qy1WOiBLVk06IEZpeCBBUExJQyBpbl9jbHJpcFt4XSByZWFkIGVtdWxhdGlvbgo+Cj4gICBhcmNo
L3Jpc2N2L2t2bS9haWFfYXBsaWMuYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

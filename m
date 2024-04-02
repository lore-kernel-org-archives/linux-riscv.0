Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7B4C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 16:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8o2gWPXD2+oSgzWLSPXgzgejtxdsl1Yr7640K12aso=; b=vUUD9C9Bt+KysV
	wCdGzJczySm1uOXcO0UTLQClLwtGid9yfp9VjxMllFmMn+z9491pyK5sezUZNieELCaRgClJqkHlD
	wAbprC0S5gqdBu9tC/WICymrDJ2yJngCJvzUlwyIlKNAWztE2hEvUaI1exdJI11PzuG/HYan2vQ1Y
	qQQ2YjDtE0GK6kZxFsp8KuhpHvsw+zR7fha3uFQOHQWu9MBB0ydblwUHw6OnOifYc/7lV58/X0Dqq
	OmaUdldxqPfpjDAlQRBslV8xVI5ums8NHijz9RBavaZ1zOtaiSd+a5aJ2kTyTrVx+vlX/snu+Z3Ka
	Ktyh2DT9Z86yDNN22C1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgz7-0000000C2u3-3xe9;
	Tue, 02 Apr 2024 16:27:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgz5-0000000C2sW-35dD
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 16:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712075258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DUvuzJkhgeIbEx3kwWWb2/fdwHNDJzTQC6qK3IdEcUs=;
	b=imTDLJem1V/L8YqeWHhQAZ4DLdyC0xsnFjU7yynos8qmsjmXrqdTspPvDrb4q7nKkpNQ9U
	nF1V1QgNfYwQ6DH/2al4yJU83aZbdeTqcWBCd/r2GbF1mBWuqpL+pjad7Dd/0fckb2vnRn
	vklTlHGjg66wUlib/g+PQv4bZbWVvFs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-94rKHE0HNya2ZDQ7UkDKpg-1; Tue, 02 Apr 2024 12:27:37 -0400
X-MC-Unique: 94rKHE0HNya2ZDQ7UkDKpg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3436c819065so5741f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 09:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712075236; x=1712680036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUvuzJkhgeIbEx3kwWWb2/fdwHNDJzTQC6qK3IdEcUs=;
        b=XUO2CRg+R2FQb+Cla59FuBLIxbZbhjq4ypG67dO13jQFfI7TJYTcCDDwYlfaANkrib
         Q7MgC+fm+z61S9mVjLMsIUeUIj3aEELkoRqRUysyd4T8i+UlyiVR6Okr9lQGC9Wmy9l9
         UrWi4yaKiPnLos5Sb+0POReMIcM5L1dxvvNdoiq2OVJ5KAZJmuc3y8Pp0HUaNU/kp1rI
         726eWgJq9KYi7KAOqgkOHFYOZkFIo3ajvzHgp1CvtaUbg7Mp0l75tqcePhqD+JIiqkGF
         B4yG1mm7dp4Iz4Esi17ZU81prFTm8vXkhDpqk3SFN5sva7bWtiCzhGVPysrxoJSbRhCV
         3IWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/ceHPZMn/65n1P644v6Iev+NvwwKyvaWS/eQVb4L25zGOP23wFKL2f+RRLsotG0erT+dVEtW5sOUryFztQ7H9c1oOakqAoiNg0ZGdsPb
X-Gm-Message-State: AOJu0YzaeVJAlQK5dYUydnsQ2N7ZskU+qRRgvHVORL+S0K0SrH5xbjor
	9U1xtyOmWw9jFONEYmL0LrXDsolgrbjeXvVECPgG3wnoIBwAj2pW7ellSR+MJ42vg04H3GzARw6
	8OspivVR37Gb8fgs1oDNWQLxjZAH5d9kIGhQ2qCsOCzLPnjUKNCSc/pP3orEpIzCbBv0v2ENPmA
	X/nbtsKAy16F2oh+4XXAmKeSrcvaG2SlzQlQmEUPfC
X-Received: by 2002:a5d:4b52:0:b0:33d:7e9:9543 with SMTP id w18-20020a5d4b52000000b0033d07e99543mr11576994wrs.32.1712075235980;
        Tue, 02 Apr 2024 09:27:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPdJjojZpCbVTwj+daJynuypEfeW/dgyJw07L+cbjNX73qYfysRGlGJgKpJlSzHkF09cMYYitKdc4IyYAmC9k=
X-Received: by 2002:a5d:4b52:0:b0:33d:7e9:9543 with SMTP id
 w18-20020a5d4b52000000b0033d07e99543mr11576963wrs.32.1712075235633; Tue, 02
 Apr 2024 09:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2e237A_vA022kh3cmy-YJ_t=0iXyRkbQS3NSR=_Z+6HA@mail.gmail.com>
In-Reply-To: <CAAhSdy2e237A_vA022kh3cmy-YJ_t=0iXyRkbQS3NSR=_Z+6HA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 2 Apr 2024 18:27:04 +0200
Message-ID: <CABgObfYWXOo-cLGWrb1OKTgJX5zKdvRkJNw7i9AKGz1dsWp4cA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.9, take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_092739_860814_0BE88CFD 
X-CRM114-Status: GOOD (  11.95  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCA1OjQ44oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4gd3JvdGU6Cj4KPiBIaSBQYW9sbywKPgo+IFdlIGhhdmUgZm91ciBmaXhlcyBmb3Ig
Ni45LiBPdXQgb2YgdGhlc2UsIHR3byBmaXhlcyBhcmUKPiByZWxhdGVkIHRvIGluLWtlcm5lbCBB
UExJQyBlbXVsYXRpb24gYW5kIHJlbWFpbmluZwo+IGFyZSBjb3NtZXRpYyBmaXhlcy4KPgo+IFBs
ZWFzZSBwdWxsLgo+Cj4gUmVnYXJkcywKPiBBbnVwCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgY29tbWl0IDRjZWNlNzY0OTY1MDIwYzIyY2ZmNzY2NWIxOGEwMTIwMDYzNTkwOTU6Cj4K
PiAgIExpbnV4IDYuOS1yYzEgKDIwMjQtMDMtMjQgMTQ6MTA6MDUgLTA3MDApCj4KPiBhcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXRodWIuY29t
L2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3YtZml4ZXMtNi45LTEKPgo+IGZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA4ZTkzNmU5ODcxOGYwMDVjOTg2YmUwYmZhMWVlNmIz
NTVhY2Y5NmJlOgo+Cj4gICBSSVNDLVY6IEtWTTogRml4IEFQTElDIGluX2NscmlwW3hdIHJlYWQg
ZW11bGF0aW9uICgyMDI0LTAzLTI2IDA5OjQwOjU1ICswNTMwKQoKUHVsbGVkLCB0aGFua3MuCgpQ
YW9sbwoKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gS1ZNL3Jpc2N2IGZpeGVzIGZvciA2LjksIHRha2UgIzEKPgo+IC0g
Rml4IHNwZWxsaW5nIG1pc3Rha2UgaW4gYXJjaF90aW1lciBzZWxmdGVzdAo+IC0gUmVtb3ZlIHJl
ZHVuZGFudCBzZW1pY29sb24gaW4gbnVtX2lzYV9leHRfcmVncygpCj4gLSBGaXggQVBMSUMgc2V0
aXBudW1fbGUvYmUgd3JpdGUgZW11bGF0aW9uCj4gLSBGaXggQVBMSUMgaW5fY2xyaXBbeF0gcmVh
ZCBlbXVsYXRpb24KPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBBbnVwIFBhdGVsICgyKToKPiAgICAgICBSSVNDLVY6
IEtWTTogRml4IEFQTElDIHNldGlwbnVtX2xlL2JlIHdyaXRlIGVtdWxhdGlvbgo+ICAgICAgIFJJ
U0MtVjogS1ZNOiBGaXggQVBMSUMgaW5fY2xyaXBbeF0gcmVhZCBlbXVsYXRpb24KPgo+IENvbGlu
IElhbiBLaW5nICgyKToKPiAgICAgICBLVk06IHNlbGZ0ZXN0czogRml4IHNwZWxsaW5nIG1pc3Rh
a2UgInRyaWdnZWQiIC0+ICJ0cmlnZ2VyZWQiCj4gICAgICAgUklTQy1WOiBLVk06IFJlbW92ZSBz
ZWNvbmQgc2VtaWNvbG9uCj4KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgICAgICAgICAg
ICAgICAgICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysrKystLS0tCj4gIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9hYXJjaDY0L2FyY2hfdGltZXIuYyB8ICAyICstCj4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMgICB8ICAyICstCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

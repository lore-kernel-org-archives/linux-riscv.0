Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93A2CE9D7D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rr0dXmvZYrQo7bAb0LRqSp6G0vwefKA9P9ZVY+YDGao=; b=a11p4RNNyEIiu2
	QxWjgbSXflYkDQYX6eKWR6YBL3c/o747pGQ9rqtVjweJRiASvHjeUzD8FAeaSWBE0sXCHkP8I1IbJ
	IgdVB9gRydO01ikC7Pz0CMdNiohCfM2dQDLtvMykLvWLwdUJZYvktMlI6hhC7F5bqmO4uxfozqk+x
	NxhxGAkVPlZiN3c495b+IJM7c3duy5YStGCFaDhQEaIYGW7kQP/x/glD/kWxiK6s/6jKoXD6JZZ98
	aWG8dLghMkBnZJ935EBpF3wwuGUtSdj7PbK46lUp/n6cgUrvw/BR6MG4id2+5Op2cKZREfTSIWM3k
	x4Xi5k217yikqhfzKcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA1Z-0000000DV7X-1Cnq;
	Tue, 06 Jan 2026 16:35:13 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA1W-0000000DV6f-1p4c
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 16:35:12 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7ce2b17a2e4so716209a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 08:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767717309; x=1768322109; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNrz9UQpAZyojBAeX05y5M58klvOpfZIZjcce2E7lpQ=;
        b=x2zCEenZox87b81EffLd/5c4QDEXx9NrkettSe7O8bzgWaKS7qJyirSDNrWoWGDBTJ
         gvkXK/xG2zbbdZdMHy2sTaNTlGn3k7hvpLpI7aWMk7s6jQGTWDyOR7+BXcfJcfWkvJak
         rr+TWBg3nBW7L2xByhk5ldrpjkJs1tiRpqSZipMy0Qw3e7K6kd1tS+emFTC7e2DsBrla
         qvqeI7YDV+SRPn2bDKdnf2wyTJFRGdbKufoNdTTs/kPYiAt219KrbFMm6to+6cnV1BFP
         QNwymczDgTCbqb+bqHZ5GeYdR0uqz/eJDdFKeKd26/8mElobooPDN+uPxxzYiosa/KhQ
         XU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767717309; x=1768322109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bNrz9UQpAZyojBAeX05y5M58klvOpfZIZjcce2E7lpQ=;
        b=FwO66eKSf3ePh3IrQXy0q7iwpCv3vJ0PFJRqARYb6aXHVQvPIYxnsF632/MsuO1HhS
         Gv4PhoZaWRP4N6RQL9Fo3hu5sULqFHVfhibqSAuQQEE+apqQcEF2zxdw08ZNLcI67n6W
         vM6qd2kjN0srfvmzoVvOQHLzsuNWdD5eyGWp6WuX/mvoZvDrMrwwknLicIRqVbbk0336
         PaMbTOo3AZepbRf8WI2gCGSz4rFbzM//TbZb9QduWi1Fdr0yqzRT3+DRDvUThp7bOjFC
         hbwWXvVnzk4bSvvNlmOX+iBWGYQrNr4qy88HPJvIrDCSfnzv1QvjshVQc1OALTF63QMA
         SlXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnZJ6c3U1M7zA6QZ1ahYlLQB5/3ZlKrwJiYlQBeu6YrcSRMThSIla+juRIWhZ3CInKNNBT+8NF1PLCqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz47bpIY4unFXdQeqcrpQZOMEvlk4H16wkc3mNN20WqX14x7owO
	fqHGq3OvBT/xinm38eHY2hfRozlWb8/fAA7a1EX1MtKxBGAVHsj9WXBCFInb3zHUxWJ1ReB4cIH
	mCIYd7Q9EmZ+4IEQliMzCtnCa/fOwsepoHuLd4VFkCA==
X-Gm-Gg: AY/fxX6uWvfd4t+weW5509v6hP+dWSARTXVu13HwEhEvbHtg08gzRHXawcuvMJ3mhAi
	7MtN2NsXNkYH+n0D1DH1oN8jskGXDo391uppqeEQTFHXWoSg1Ppwex85QCjz+QxcBDj4cvRNECd
	Pu3gZUHRXC8sPmLiq1pJRDa+qEI+BIsv75bye0vyJyc/nJ1QTgcBnXgwGaDuua69VO7eGEixFzt
	BqZSQsxMgjW+y0qPakXWnaknyJDVbQwYvq377S6BzCCiE3qqSQtH13tq8J4pnDf6p8CB16hi8IT
	rQBuwJAH68A2Y4rwQfHDvIbKSUxHSWkQqUmmZSL4h6+diiBESC6CR0dUIA==
X-Google-Smtp-Source: AGHT+IEqXxTBeH3LP0fUVizISuCkdADz10TXUBGRVWD+OKCNI8kCKzHUOCYj5zq7rrrDTSe7deN3OOyJ+Sim2FJxOUk=
X-Received: by 2002:a05:6820:4908:b0:65d:2f7:6eb5 with SMTP id
 006d021491bc7-65f47a9ac10mr1471540eaf.66.1767717309018; Tue, 06 Jan 2026
 08:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20260106162848.22866-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20260106162848.22866-1-ben.dooks@codethink.co.uk>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jan 2026 22:04:55 +0530
X-Gm-Features: AQt7F2om0UlRUlewDfBuWexms2k5z-xmHfO0JSMf-AgqjjVg_PjC4qOz0utW3LY
Message-ID: <CAAhSdy1w485+mTNCmX+KgQVnLr5iyDyPLm5+w2QwA+SxQ-2mVw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: fix __le64 type assignments
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, palmer@dabbelt.com, 
	pjw@kernel.org, atish.patra@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_083510_609492_84CD5EA5 
X-CRM114-Status: GOOD (  14.75  )
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCA5OjU54oCvUE0gQmVuIERvb2tzIDxiZW4uZG9va3NAY29k
ZXRoaW5rLmNvLnVrPiB3cm90ZToKPgo+IFRoZSB0d28gc3dhcHMgZnJvbSBsZTMyL2xlNjQgaW4g
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbmFjbC5oCj4gYXJlIGdlbmVyYXRpbmcgYSBudW1i
ZXIgb2YgdHlwZSBhc3NpbmdtZW50IHdhcm5pbmdzIGluIHNwYXJzZSwgc28KCnMvYXNzaW5nbWVu
dC9hc3NpZ25tZW50LwoKPiBmaXggYnkgdXNpbmcgX19mb3JjZSBhbmQgYXNzdW1pbmcgdGhlIGNv
ZGUgaXMgY29ycmVjdC4KPgo+IEZpeGVzIGEgbnVtYmVyIG9mOgoKcy8uLi4gbnVtYmVyIG9mOi8u
Li4gbnVtYmVyIG9mIHNwYXJzZSB3YXJuaW5nczovCgo+Cj4gYXJjaC9yaXNjdi9rdm0vdmNwdS5j
OjM3MToyMTogd2FybmluZzogY2FzdCB0byByZXN0cmljdGVkIF9fbGU2NAo+IGFyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYzozNzQ6MTY6IHdhcm5pbmc6IGNhc3QgdG8gcmVzdHJpY3RlZCBfX2xlNjQKPiBh
cmNoL3Jpc2N2L2t2bS92Y3B1LmM6NTg2OjE3OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBh
c3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPiBhcmNoL3Jpc2N2L2t2bS92Y3B1LmM6
NTg2OjE3OiAgICBleHBlY3RlZCB1bnNpZ25lZCBsb25nCj4gYXJjaC9yaXNjdi9rdm0vdmNwdS5j
OjU4NjoxNzogICAgZ290IHJlc3RyaWN0ZWQgX19sZTY0IFt1c2VydHlwZV0KPgoKUGxlYXNlIGFk
ZCBhIEZpeGVzIHRhZy4KCj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29k
ZXRoaW5rLmNvLnVrPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9uYWNsLmgg
fCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbmFjbC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbmFjbC5oCj4gaW5kZXggNDEyNGQ1ZTA2YTBm
Li4yNDgzNzM4MDI5Y2IgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
bmFjbC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbmFjbC5oCj4gQEAgLTU4
LDExICs1OCwxMSBAQCB2b2lkIGt2bV9yaXNjdl9uYWNsX2V4aXQodm9pZCk7Cj4gIGludCBrdm1f
cmlzY3ZfbmFjbF9pbml0KHZvaWQpOwo+Cj4gICNpZmRlZiBDT05GSUdfMzJCSVQKPiAtI2RlZmlu
ZSBsZWxvbmdfdG9fY3B1KF9feCkgICAgIGxlMzJfdG9fY3B1KF9feCkKPiAtI2RlZmluZSBjcHVf
dG9fbGVsb25nKF9feCkgICAgIGNwdV90b19sZTMyKF9feCkKPiArI2RlZmluZSBsZWxvbmdfdG9f
Y3B1KF9feCkgICAgIGxlMzJfdG9fY3B1KChfX2ZvcmNlIF9fbGUzMilfX3gpCj4gKyNkZWZpbmUg
Y3B1X3RvX2xlbG9uZyhfX3gpICAgICAoX19mb3JjZSB1bnNpZ25lZCBsb25nKWNwdV90b19sZTMy
KF9feCkKPiAgI2Vsc2UKPiAtI2RlZmluZSBsZWxvbmdfdG9fY3B1KF9feCkgICAgIGxlNjRfdG9f
Y3B1KF9feCkKPiAtI2RlZmluZSBjcHVfdG9fbGVsb25nKF9feCkgICAgIGNwdV90b19sZTY0KF9f
eCkKPiArI2RlZmluZSBsZWxvbmdfdG9fY3B1KF9feCkgICAgIGxlNjRfdG9fY3B1KChfX2ZvcmNl
IF9fbGU2NClfX3gpCj4gKyNkZWZpbmUgY3B1X3RvX2xlbG9uZyhfX3gpICAgICAoX19mb3JjZSB1
bnNpZ25lZCBsb25nKWNwdV90b19sZTY0KF9feCkKPiAgI2VuZGlmCj4KPiAgI2RlZmluZSBuYWNs
X3NobWVtKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gLS0KPiAyLjM3LjIuMzUyLmczYzQ0NDM3NjQzCj4KClJlZ2FyZHMsCkFudXAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

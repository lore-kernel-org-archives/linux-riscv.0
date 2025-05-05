Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FD5C3ABB0
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 12:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9OWMCvsYnCQ4of7kOQrWm6CrWxzyGm4MKVG4NV/4Rs=; b=DOYXEPO4hn6gjj
	xnMOK7tzU+qxCErqkXf/Nhpcm6SseB9uFyT5MX2tUyewP+OM8lQZDkXtRgcFBqQnfJs40dHxKsKxo
	0SWGpmaPOdhkcgIVcyuv9+eKW0kLffIwFiyoIJG5YxnODPlgxsAOPPpxVtcNieneawsCueCW83Oia
	IlguRRfw2oG+ePyw9/GtqIvqUHS/deRjNNtzchQ+I980DgOfmzpvfScra7UMN0f4A3+grT9eROWcj
	SJBL0zEri3RsBrI2rUpYSLuvPFNtOX64+vKzHzxwKdJUibVXDLhBcoNtW3be5NzNhd4jVeLUHTMwx
	WEhTMQEzK5DQ/XzaEhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv57-00000007LP6-2BXt;
	Mon, 05 May 2025 12:38:01 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuzW-00000007KEy-195k
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 12:32:15 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so11730895ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 May 2025 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746448333; x=1747053133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ROvQBGSdDBOd+A03xhzhhLZdwd+Yr3g8998GOj2eyg=;
        b=Wo8XVeU4EPhFqDGA0/n4Yyo6TTJ82bOWbBoRiBa93QV+NFlTwmtcZsMhPDTLpyo1Lg
         cDPThLk7ML44DdcMY1rTuxKkOA6V+K5o87MCa2KLgLtt/xroN/uwL/IpRJ8k24hunmB4
         EukjRlh0GbDh00pQ1wR9sQZtoD+DyaB8mHJMHZUOLimVkJaAXmxUHZXdy7N8IEhc2vcw
         8wA/9CBeXSDUO/Go9W8sFyuVqWCvBOtbVxtZKAcVl8fujHR2go30j07apWq0Zzos6dTs
         TXXvX7Bzf6I8H2OJBdUJqxMOPIO2ydlMWlPY1egGifErOPdPrKbvltwM95uCXoT0nUXl
         s9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448333; x=1747053133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ROvQBGSdDBOd+A03xhzhhLZdwd+Yr3g8998GOj2eyg=;
        b=CelkQK4Nn7z0ikQR66EBJ9d3cfPWgR0/SDWjx8RDJRa/8bsm2YhYN9HE0M0FDlmaSQ
         +vesk2Zz7E2Z3NsOgvvmQ1+KcfjWJrx0N2Bghz9WwXwRdtx54rmlJCUCZmzIV81ezx2L
         IvO+v/8POVUZ/dQipQQKM8dRFhXpISveIuF5Mc7plCtMBdIf5Fml6JpKYclG/lsdrVMl
         k4zz/gBVEiAAZhVeK6sCdt1KZ2mC0Zqu+QVhgYxvZmB8KyxYOsrMsbxnSIE/Z9xaFbIA
         356Bzvami9croT3Fn4xr4V4IKPP4wY5w73H+8JpQPtLAuG4XbZNZ97CNtMKkkR5qb9pD
         xfXQ==
X-Gm-Message-State: AOJu0YybweUr6lPg2Io4FcUK5jH8UWeRcyo+Nm8lHdMkkh1tsTa+V4Hh
	/RV7l733P2DF6qyxP1J3fZ6GqQ+3SaZDk+N3citRIIViuyO50D92CpiT0ObTWgJiquotoHEmN2j
	5xDjMpjgZJq61E59RF0BsB0VdBFqxZpf0WjyjTQ==
X-Gm-Gg: ASbGncu1zD5xroRJ7qe1V6ZwtfAHJVdvSDMT1DWRLa/sv1h7MGr4ig/UGiG6tx5+E73
	/c15Ulg7qU4vG0IZaDNcMQ76Nqv3cRaHuT6C2pHm1VcTWUkP+pPSN3Ft+291n5wnShf/Mctfst9
	OXRkHfHLz0u2TeKoKzLxARa6E=
X-Google-Smtp-Source: AGHT+IGKfyVuSpXvhyCqr3MzLrMWyvS/DXDaTYYmrBeFPlCthPJdi1/XEIr6vTapFuhwTG/+VDZdp44YaLe79OiDUvE=
X-Received: by 2002:a92:ca4e:0:b0:3d8:2023:d048 with SMTP id
 e9e14a558f8ab-3da569fc0fdmr78214885ab.22.1746448332626; Mon, 05 May 2025
 05:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com> <20250227123628.2931490-2-hchauhan@ventanamicro.com>
In-Reply-To: <20250227123628.2931490-2-hchauhan@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 May 2025 18:02:03 +0530
X-Gm-Features: ATxdqUH3w6mQ0qSoQ0tXhdBpHdmtraVQBLRXb-lEZsWxpb787pmCQYQjNjM4yWg
Message-ID: <CAAhSdy1bupf80qpio6-HpwzC53MW3UguKj+zxd3Zmduxay4rpg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/10] riscv: Define ioremap_cache for RISC-V
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053214_516900_7E0C4F09 
X-CRM114-Status: GOOD (  13.91  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, linux-efi@vger.kernel.org, acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, conor@kernel.org, robert.moore@intel.com, linux-acpi@vger.kernel.org, tony.luck@intel.com, palmer@dabbelt.com, paul.walmsley@sifive.com, james.morse@arm.com, linux-riscv@lists.infradead.org, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgMjcsIDIwMjUgYXQgNjowOOKAr1BNIEhpbWFuc2h1IENoYXVoYW4KPGhjaGF1
aGFuQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gYmVydCBhbmQgZWluaiBkcml2ZXJzIHVz
ZSBpb3JlbWFwX2NhY2hlIGZvciBtYXBwaW5nIGVudHJpZXMKPiBidXQgaW9yZW1hcF9jYWNoZSBp
cyBub3QgZGVmaW5lZCBmb3IgUklTQy1WLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGltYW5zaHUgQ2hh
dWhhbiA8aGNoYXVoYW5AdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9pby5oIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaW8uaAo+IGluZGV4IDFjNWM2NDEwNzVkMi4uZTIzYTQ5MDFlOTI4IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW8uaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaW8uaAo+IEBAIC0zMCw2ICszMCw5IEBACj4gICNkZWZpbmUgUENJX0lPQkFT
RSAgICAgICAgICAgICAoKHZvaWQgX19pb21lbSAqKVBDSV9JT19TVEFSVCkKPiAgI2VuZGlmIC8q
IENPTkZJR19NTVUgKi8KPgo+ICsjZGVmaW5lIGlvcmVtYXBfY2FjaGUoYWRkciwgc2l6ZSkgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICgoX19mb3JjZSB2
b2lkICopaW9yZW1hcF9wcm90KChhZGRyKSwgKHNpemUpLCBfUEFHRV9LRVJORUwpKQo+ICsKClRo
ZXJlIGlzIGEgY29tcGlsZSBlcnJvciBvYnNlcnZlZCB3aXRoIHRoaXMgcGF0Y2ggYXBwbGllZApv
biB0aGUgbGF0ZXN0IExpbnV4LTYuMTUtcmNYIGtlcm5lbC4KClRvIGZpeCBjb21waWxlIGVycm9y
LCB3ZSBuZWVkIHRoZSBmb2xsb3dpbmcgY2hhbmdlOgpzL19QQUdFX0tFUk5FTC9QQUdFX0tFUk5F
TC8KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK

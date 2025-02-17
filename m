Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED1BC021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQDj0oD28RebjKD0Hf0xHHyHb26ZwEm7qEbZ7KFZ5UI=; b=b1LmsM68/KjCQB
	B94sy4oZBjpN7PfBe3iBQTj8moVy9FYph4hJuQVU5f5Zql+uIZI3h43X8ZxOp84bSvDr0BT3E5coa
	uqpKYQ1lJaQNjL1WKS6PnoVISxM0B2pfBQJ1zir4uPL27n6TkjenJa85ddU07KWfWOJZYWo60DIku
	qume+64gVrnla3nY/0qhD1v8d9eZGNXZsS4+uKrF2j1KrdiSyhALkPZMJIZkP6egqwnVo6Wl+zOd2
	hWHKwjmA6GG3iw5dfiOvfPLrTc76btTOCMMWe0DVb+7ddIzE2pxmn5li99ULfV2QkwviyTa+IPSnW
	/QFq7Hfn2+E4m4/vDojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjylX-00000004CKV-0C0Z;
	Mon, 17 Feb 2025 10:54:19 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyUQ-000000048NC-2GIi
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 10:36:40 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-855183fdcafso137423939f.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1739788597; x=1740393397; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXuIrr0uZbsvb+1H4q1P/dQZuaUoc6czcr9gRmWyKlc=;
        b=zQhqWPn5e/cS3JUJpH5rqQ6BVnqQHKIDf+hyZMI4E9hopwKAv85Eb4nJj/8nfZaflb
         ar2UCVYLXmhytANwvNWD8eUzAk2j9TwQybJI2isAlRCEvRSOao5q82AJCD2r/sqeGiQX
         +KEH7iblNdJrBV6hpWjrVwD9arBgxTugH7Yxx2OQAMfu6vsOQ0drv1i9RTDXnIfqu99l
         GNVkCDeA9Tgpv1fhogE4aYyH14hUq+E4mhsLMYa1EZfiIpt0913QZ13rHnr3J4LaeUOr
         UV/DagUsvj5CJrSAa6hQuevECo4RWZcKTW+r6iaiUB8TXlXVcLjlRZDL731/c8zlr82S
         WJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788597; x=1740393397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXuIrr0uZbsvb+1H4q1P/dQZuaUoc6czcr9gRmWyKlc=;
        b=wYq/fuFXvaz35d4xFXyTi9PjCYqYwC0NL8aB0MpPH9AQY8VIEUBE2XHsyURXUjJobC
         QxqA0nbucAiiO2gR21qdNdbtDsy3dTxD+3e+4XmmEOadJZwtaVddVPf9OMduZc5Q7ZGs
         IkLmCYaq0dRjqCDuhqZHPul36DrSPFg+VHxZtVwvZ6yZQPXVMaasIaE+GtoFS7a7rf/v
         rDNQAhyZ9QPTtnCryMeICSFTA8CUxGBAdRgdwVEVKevBMKW+h5oW70/m6Lr0nEZKKO+9
         Cs0MXjHdVb9yBbMd24FN7m0unHyEc3msRn7TRcZnhoYwMImuchvzPCDQGMgqa4Hbkz6g
         p7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXEAptX0YirqhO0WbSMHj/80yFjs2N9XQUyY/p4MCIUms4THNPhaH+2xx4QqvfO8seyycEuP/U2w7smw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhHG2BiSiALaAj/CuyASu31J8XvSsYuMhK2KWImETZe3roxnZi
	1xJP1blWCs4KdI8hIVV8rsSnFaSiHqLV3Z8voqFXm4KvoDExwmyR5bTcL5Spm9yJzEaQsrBZFrO
	Bobo7K6eHh8hWgVWyT8bhAuXf1K/9SLReU+HN5w==
X-Gm-Gg: ASbGncusLw9UY0oaNkvsyko9P9AAUTuWTKil/6yikMROJv868FlPFSSMAmLAvDwjVjG
	6l+WZQPU1+w7YLkpfbe6IyxCqIiLtO7YNiMc4ghizWWddxUhbDB5hzTjJdPqRbnMAztaPJOGxeg
	==
X-Google-Smtp-Source: AGHT+IEw269iT/y4krWNO0LRo2RLfVtDkGsMXcWgAorAmpNUQzvjAfq/Q6R4P+Rr0miTce5VQs94e89cnvKhqhjf5ic=
X-Received: by 2002:a05:6e02:184d:b0:3cf:b2ca:39b7 with SMTP id
 e9e14a558f8ab-3d281e294f4mr66755685ab.3.1739788597288; Mon, 17 Feb 2025
 02:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20250217084506.18763-7-ajones@ventanamicro.com> <20250217084506.18763-8-ajones@ventanamicro.com>
In-Reply-To: <20250217084506.18763-8-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Feb 2025 16:06:26 +0530
X-Gm-Features: AWEUYZkeJbANn3o67oIBgEtVLiGAHW5hziZFAcMUSpUUnQ4RfYuy1apwMnNIRW0
Message-ID: <CAAhSdy14rpAPQcv0nuhZ6DRhABa38cBq3oB7y28X6Fe8_adCbw@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: KVM: Fix hart suspend status check
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_023638_743731_AF548709 
X-CRM114-Status: GOOD (  14.66  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMjoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gIk5vdCBzdG9wcGVkIiBtZWFucyBzdGFydGVkIG9y
IHN1c3BlbmRlZCBzbyB3ZSBuZWVkIHRvIGNoZWNrIGZvcgo+IGEgc2luZ2xlIHN0YXRlIGluIG9y
ZGVyIHRvIGhhdmUgYSBjaGFuY2UgdG8gY2hlY2sgZm9yIGVhY2ggc3RhdGUuCj4gQWxzbywgd2Ug
bmVlZCB0byB1c2UgdGFyZ2V0X3ZjcHUgd2hlbiBjaGVja2luZyBmb3IgdGhlIHN1c3BlbmQKPiBz
dGF0ZS4KPgo+IEZpeGVzOiA3NjNjOGJlZDhjMDUgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IFNC
SSBIU00gc3VzcGVuZCBjYWxsIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmlfaHNtLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfaHNtLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYwo+IGluZGV4IGRjZTY2
N2Y0YjZhYi4uMTNhMzVlYjc3ZThlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX2hzbS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfaHNtLmMKPiBAQCAtNzks
MTIgKzc5LDEyIEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9oc21fdmNwdV9nZXRfc3RhdHVzKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIHRhcmdldF92Y3B1ID0ga3ZtX2dldF92Y3B1X2J5
X2lkKHZjcHUtPmt2bSwgdGFyZ2V0X3ZjcHVpZCk7Cj4gICAgICAgICBpZiAoIXRhcmdldF92Y3B1
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+IC0gICAg
ICAgaWYgKCFrdm1fcmlzY3ZfdmNwdV9zdG9wcGVkKHRhcmdldF92Y3B1KSkKPiAtICAgICAgICAg
ICAgICAgcmV0dXJuIFNCSV9IU01fU1RBVEVfU1RBUlRFRDsKPiAtICAgICAgIGVsc2UgaWYgKHZj
cHUtPnN0YXQuZ2VuZXJpYy5ibG9ja2luZykKPiArICAgICAgIGlmIChrdm1fcmlzY3ZfdmNwdV9z
dG9wcGVkKHRhcmdldF92Y3B1KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9IU01fU1RB
VEVfU1RPUFBFRDsKPiArICAgICAgIGVsc2UgaWYgKHRhcmdldF92Y3B1LT5zdGF0LmdlbmVyaWMu
YmxvY2tpbmcpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfSFNNX1NUQVRFX1NVU1BFTkRF
RDsKPiAgICAgICAgIGVsc2UKPiAtICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9IU01fU1RBVEVf
U1RPUFBFRDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9IU01fU1RBVEVfU1RBUlRFRDsK
PiAgfQo+Cj4gIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfaHNtX2hhbmRsZXIoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+IC0tCj4gMi40OC4xCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

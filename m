Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC25C47DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7X3NPl8Xfv17M73qDkL8pKKgNNpIhj+bAgLOQN28lOk=; b=YVfuSRH7aNnvGbunjQnMyy/d1I
	CYlPxKgXPlw9ZvoEaeyLEQUfQhryfNE6JmaYRjLkmc54ncMRGPnK6QvmdhHF5ip2akOi7eHujkSXb
	wSSGET1ItnZ/pZwa3CNGXf9Z7j2toaSv62bS4OtOdaUq5s01FI/ePSilF+eqq1u9oKQj0sWlYhgVQ
	MyDPBMNEOAMojVBjMrrbDVk9yBtYJdr56DoviTT36WJy+6k1firNFuCa2TP8lr1LdNFI5wRtyDm7k
	InfC/EdrqBMYjTiRGZMw+61169Clsi1QHBwtNIs1IuRKqk0vHlGakbPh0E9wiMS9o9fPJVFT4cpy3
	sPjhLarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQWNf-003Pod-2O;
	Thu, 18 Jan 2024 17:40:43 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQWNc-003PnX-0h
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 17:40:42 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5cdbbf7e591so6585248a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 09:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705599637; x=1706204437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Q3C3WGrieoJdAKFaeIZlXobOygHM9XDpw7BX2KbOhI=;
        b=LHwuNAdiAXFks5HsC0h6/v7tZnrEb7htlBG4DTS3bVxKae2NNjQ16I0cwAbMuJIPfo
         aN+sehYOrgJJgr8mu68B4JFa9KMTOseDW5ZNPOhfG7MbfHN1NzdzGcbBrnXilUz0bSbJ
         sNajLf2bUMVXvEXtoM1MVi2ZpeO1/JMJfXIf+htSPGB7z74RiOJTGYdWaiaL3cq81vLt
         okjgoi4CPJxE7O2OkXfk5E35+a5IxVeiNIkxMBdl7mN0Z7qV9xqXx3ySqXu544YVdiA1
         eQe2M5sds3KBsT0sF1khuYyO6Xr0mHYJpNwhRNtdhm6bdvEUsW/kVbuREf5OrTvvKHI7
         uCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705599637; x=1706204437;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Q3C3WGrieoJdAKFaeIZlXobOygHM9XDpw7BX2KbOhI=;
        b=lZwcNHPBcNSd4tglY/Cb82b2GWnIVH98ppI5XRVHxuyFyEWJHhoOzZf/sS1m8wUMbr
         rmBYg6zgCGy/hOadOdE6Uj9Q938DKMAf8YZDBGxT5kI/gTn3BuptCBG5EukLhibQPY0/
         pwMQjVsvPG6JXY3u7HrMEDEOumtYK7aGAMHKEMQOmsH1N45V++AvCEAoAtGqKPRJuGaq
         Uhq6bsan+4OGKPCC6Hf4305gIlRzbFNb0L69tKefxuZ9ZocojKFKhRzGxMxxFMno7hhJ
         mfZTGApIqgmhin7rQKielp8ilKk1+2o9ZRb4OgprAW0Cp/WceD1Vyp5xPRWlVxBy4hNW
         vfpQ==
X-Gm-Message-State: AOJu0YzR33e4pT+PSTF0pBQAsalEe1YEx1RV1ZvEiOgFESNFTZjH2pSS
	Rvle9dFkcqeA9ivBUPg8mT/ot1S73ytEgcfBiNzdB8yslc1TlsUbbH28vfbuASGk63lJVfux1h+
	FZA==
X-Google-Smtp-Source: AGHT+IHQno7PAwboCP87bGIkYG2fH+s8EoDNQ4sFTOlwoU3XmXeAa1RkI+vnnDxRDet8Cr9UHVnWumLJcOM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:63c3:0:b0:5ce:1891:dfac with SMTP id
 n3-20020a6563c3000000b005ce1891dfacmr6154pgv.4.1705599637554; Thu, 18 Jan
 2024 09:40:37 -0800 (PST)
Date: Thu, 18 Jan 2024 09:40:36 -0800
In-Reply-To: <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com>
Mime-Version: 1.0
References: <20240104123727.76987-2-ajones@ventanamicro.com> <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com>
Message-ID: <ZalilFSHBa_XHolD@google.com>
Subject: Re: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup@brainfault.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, atishp@atishpatra.org, rdunlap@infradead.org, 
	sfr@canb.auug.org.au, alex@ghiti.fr, mpe@ellerman.id.au, npiggin@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, pbonzini@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_094040_257001_A91342E3 
X-CRM114-Status: UNSURE (   9.27  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKYW4gMTgsIDIwMjQsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24gVGh1LCBKYW4gNCwg
MjAyNCBhdCA2OjA34oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gS1ZNIHJlcXVpcmVzIEVWRU5URkQsIHdoaWNoIGlzIHNlbGVjdGVkIGJ5
IEhBVkVfS1ZNLiBPdGhlciBLVk0KPiA+IHN1cHBvcnRpbmcgYXJjaGl0ZWN0dXJlcyBzZWxlY3Qg
SEFWRV9LVk0gYW5kIHRoZW4gdGhlaXIgS1ZNCj4gPiBLY29uZmlncyBlbnN1cmUgaXRzIHRoZXJl
IHdpdGggYSBkZXBlbmRzIG9uIEhBVkVfS1ZNLiBNYWtlIFJJU0NWCj4gPiBjb25zaXN0ZW50IHdp
dGggdGhhdCBhcHByb2FjaCB3aGljaCBmaXhlcyBjb25maWdzIHdoaWNoIGhhdmUgS1ZNCj4gPiBi
dXQgbm90IEVWRU5URkQsIGFzIHdhcyBkaXNjb3ZlcmVkIHdpdGggYSByYW5kY29uZmlnIHRlc3Qu
Cj4gPgo+ID4gRml4ZXM6IDk5Y2RjNmMxOGMyZCAoIlJJU0MtVjogQWRkIGluaXRpYWwgc2tlbGV0
YWwgS1ZNIHN1cHBvcnQiKQo+ID4gUmVwb3J0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPgo+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNDQ5
MDdjNmItYzViZC00ZTRhLWE5MjEtZTRkMzgyNTUzOWQ4QGluZnJhZGVhZC5vcmcvCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IAo+IFF1
ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjgKClRoYXQgc2hvdWxkIGJlIHVubmVjZXNzYXJ5
LiAgQ29tbWl0IGNhYWRmODc2YmI3NCAoIktWTTogaW50cm9kdWNlIENPTkZJR19LVk1fQ09NTU9O
IiksCndoaWNoIGlzIGluIFBhb2xvJ3MgcHVsbCByZXF1ZXN0IGZvciA2LjgsIGFkZHJlc3NlcyB0
aGUgRVZFTlRGRCBpc3N1ZS4gIEFuZCB0aGUKcmVzdCBvZiBQYW9sbydzIHNlcmllc1sqXSwgd2hp
Y2ggcHJlc3VtYWJseSB3aWxsIGdldCBxdWV1ZWQgZm9yIDYuOSwgZWxpbWluYXRlcwpIQVZFX0tW
TSBlbnRpcmVseS4KClsqXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDAxMDgxMjQ3
NDAuMTE0NDUzLTYtcGJvbnppbmlAcmVkaGF0LmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=

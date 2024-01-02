Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D1AC47074
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVwX6Xi9+uFlB5jR5XGn3Ipyc5cJqIxSPkr8DLMLqUo=; b=myuNANZPIIdAz3
	Ptf0kFBsgW+WHKG9o7AlwB8FLhgMVb5uq+83xdD6GImO0l1i7/VKQUyRgVyBtjQKnoiDV1ou1NT5I
	DC+ZJ/49nwuTijv0kjrNnc7ELQSn0PlkjrvO5K62GCGtj7OyQwbRp941ADo2qS5H0YRqTC3Onbxpb
	sfEw8QKmpc2yHV6q8n+Zn12UCY5JwMDHKRt1gNUHtVay5OwadckSF71xmefY4Oygmj3yLdUWyBR2m
	X+wNASSAYIPSj/U9V555ZAse8+UfGTcUjzPerpnqGL6tZku/CS0UNneNvSjGHUk+v/HLIODQf8oN2
	qL3fCMeYhomke6F0v6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKlKm-008vja-2C;
	Tue, 02 Jan 2024 20:25:56 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKlKi-008vix-2n
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 20:25:55 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a27db7d85c7so200868266b.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 12:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704227151; x=1704831951; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NExEDV8tMM90xF5QlyIZ/qRPsBLYQaG4/Qh4/SWZL/Q=;
        b=nlWGvZaBJoq3KRsqe6ZG4GTbLRoRZA1CNLld1oAcv0gzbv9sx7WlspvdUVmzclDJH/
         79V5xNUWUbTYTvfcMRvPv1L0gkFfxXqEF276BOo8MGWk8WSYKYxkS3NG8sFy/RAfvMI4
         9NaeW4eZl4AwslLnaveNAuexEyvr4l8Dvjq1y4H6mihuOqM0+UfP9adBEZiOMOQoDp/Z
         qlLLo5x1gvB4HuhsZBG/bqn3UbKTGeGKw5Rj1IssQBWvSUm+GwMiOXNLvHn7xapm/gdk
         aMZw90z3auiueu1RFOxR90hPPLb9Wl5U5bKRAuqxkS4e/xuJ4Aer3IE9ll1+m1XUIvGj
         x9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704227151; x=1704831951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NExEDV8tMM90xF5QlyIZ/qRPsBLYQaG4/Qh4/SWZL/Q=;
        b=Dx7pYyoAY5Ux2jn+kqt8DFot+O3pqUKRxRf/wzN1jfe3JV9Z9TzVi9WvdBUDwzuDt7
         cW1LF6Krl1tE5kruiSMMN/s5kMQA8gysqbZM0EUoAQE1VqL1QsITnT3vKBFhJOKBSn91
         9R2thGxN6YTnRlioFJaMSfOcLck3JzApAdxMak1Lx+n4CjGa2y4eE85JJ0irbkolx44+
         LvlSJFDfsKHJpZaeMQVS7IraBNvXCYnTKlTN5+poomqIoKtF3m1mOAFMcyNtx84w8SH+
         9lMEHfIEhMLq5etBplC4hBXXPu8pWlw4ZJ1f78Is4ttbLxHUsqFRoASuvxycyZR6Cglx
         W5cA==
X-Gm-Message-State: AOJu0Yw7OKhf8JHCwQ/Re5SEAqYnNDjeHvFoLk4c+C05/Q1c4RXtLWkP
	dJpKjU63GPwM/b1RF/YX6YgCGTap2gvvyw==
X-Google-Smtp-Source: AGHT+IGoZoqDAXnZi0UM3QsliCD4sz5wHpUirjmUAYgkmubdexz5ZCsn37/7027mpZ7WypUu2miOjg==
X-Received: by 2002:a17:906:1186:b0:a28:2ce:fa93 with SMTP id n6-20020a170906118600b00a2802cefa93mr1527288eja.15.1704227150959;
        Tue, 02 Jan 2024 12:25:50 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id vl8-20020a17090730c800b00a27eddc3dcbsm2463253ejb.198.2024.01.02.12.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 12:25:50 -0800 (PST)
Date: Tue, 2 Jan 2024 21:25:49 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: Re: [GIT PULL] KVM/riscv changes for 6.8 part #1
Message-ID: <20240102-c07d32a585f11ee80bd7b70b@orel>
References: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
 <CABgObfZN4_xvOHr8aukZZGZj5teWZ7rt5RJU5Y0YFewQk19FRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgObfZN4_xvOHr8aukZZGZj5teWZ7rt5RJU5Y0YFewQk19FRw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_122552_912945_9B649754 
X-CRM114-Status: GOOD (  17.72  )
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

T24gVHVlLCBKYW4gMDIsIDIwMjQgYXQgMDc6MjQ6MjZQTSArMDEwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiBPbiBTdW4sIERlYyAzMSwgMjAyMyBhdCA2OjMz4oCvQU0gQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgUGFvbG8sCj4gPgo+ID4gV2UgaGF2
ZSB0aGUgZm9sbG93aW5nIEtWTSBSSVNDLVYgY2hhbmdlcyBmb3IgNi44Ogo+ID4gMSkgS1ZNX0dF
VF9SRUdfTElTVCBpbXByb3ZlbWVudCBmb3IgdmVjdG9yIHJlZ2lzdGVycwo+ID4gMikgR2VuZXJh
dGUgSVNBIGV4dGVuc2lvbiByZWdfbGlzdCB1c2luZyBtYWNyb3MgaW4gZ2V0LXJlZy1saXN0IHNl
bGZ0ZXN0Cj4gPiAzKSBTdGVhbCB0aW1lIGFjY291bnQgc3VwcG9ydCBhbG9uZyB3aXRoIHNlbGZ0
ZXN0Cj4gCj4gSnVzdCBvbmUgc21hbGwgdGhpbmcgSSBub3RpY2VkIG9uICgzKSwgZG8geW91IHJl
YWxseSBuZWVkIGNwdV90b19sZTY0Cj4gYW5kIGxlNjRfdG9fY3B1IG9uIFJJU0MtVj8gSXQgc2Vl
bXMgdGhhdCBpdCB3YXMgY29waWVkIGZyb20gYWFyY2g2NC4KPiBObyBuZWVkIHRvIHJlc2VuZCB0
aGUgUFIgYW55d2F5LCBvZiBjb3Vyc2UuCgpXaGlsZSBMaW51eC9LVk0gaXMgb25seSBMRSwgdGhl
IGFyY2ggZG9lc24ndCBwcm9oaWJpdCBTLW1vZGUgYmVpbmcKY29uZmlndXJlZCB0byB1c2UgQkUg
bWVtb3J5IGFjY2Vzc2VzLCBzbyBJIGtlcHQgdGhlIGNvbnZlcnNpb25zLiBUaGV5CmF0IGxlYXN0
IHByb3ZpZGUgc29tZSBzZWxmLWRvY3VtZW50aW5nIG9mIHRoZSBjb2RlLiBUaGUgYmlnZ2VzdApw
cm9ibGVtIHdpdGggdGhlbSwgdGhvdWdoLCBpcyB0aGF0IEkgZGlkbid0IHVzZSBfX2xlNjQgdHlw
ZXMgYW5kIG5vdwpzcGFyc2UgaXMgeWVsbGluZyBhdCBtZS4gSSBwYXRjaGVkIHRoYXQgdGhpcyBt
b3JuaW5nLCBidXQgZGlkbid0IGdldAphIGNoYW5jZSB0byBwb3N0IHlldC4gSSBjb3VsZCBpbnN0
ZWFkIHJpcCBvdXQgdGhlIGNvbnZlcnNpb25zIHRvCnF1aWV0IHNwYXJzZSwgaWYgdGhhdCB3b3Vs
ZCBiZSBwcmVmZXJyZWQuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK

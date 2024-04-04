Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD58CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 18:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tj7syhPCoFj1vqASO4h6cZPqmTJo+t1mExSl35A/Qw=; b=sZxbVn9icUtwvP
	2bkC6LgpL5EeQiiZOjNpZXtRKJARfLfMXeTAXZYjH3usqUHCzcIde7JKiUWhrSrUuobpfypg0a99r
	qAG6ZuFTH0Oum4MtLggTaN22e5tEW2pcRfAUwKTFN/RcsI08EyHcbmPhH47+PjG5n3UFGxlEHhcuh
	B9FCrLEmeTVcoKgeKzH46Ei1RSZleZ705d2YXZvVlnofvc+UaMekJ3Muub7GQYfRdWeKiER9wvyyh
	ohjUEe44slOQQ4k/0JX6jch0WuK/wSiO70hjJccgAPxpBH2wmnBfgV3ASTmObPlV132lKUK1w3xZb
	98pUd+W2DEQX3D5tuV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsS3o-00000003tYU-0oWZ;
	Thu, 04 Apr 2024 18:43:40 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsS3j-00000003tUj-40wX
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 18:43:37 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso1074381a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712256210; x=1712861010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNeaNNlhbREvV2krr1ClfJeQ8ozUNbsQyuKB+WQvTCE=;
        b=Szn8iSfXT2nFOkDRWIo3BwJjXov0Iooo9cp5Eo4rAzcleDkXNYaEwPIyyhnX+zAms+
         q71ylp8uTiw+o9Y8k8NZ9s9fy+u7MfuBtVVHvd2JyKG545xCCYYSet8StWGSMu0MBblb
         8NuPo3JDh+p9v6k0826ZMtwKzuIzh11DC0ve8XCcQoaacQoEn6pX7DJy6MYF9pe0sgTw
         TNM9oFt2IAVQFiFbn25ewkrNDA69fFzunsihh4XMGnCBJd3EzUzprFCs4rygyLNw8bkS
         tC2L1vQoQQifNAxr7UDnS2BJDDna44i1XYCALgeFBKkU4QkG53if8GxBXs8UI5ZY5VbV
         EUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712256210; x=1712861010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNeaNNlhbREvV2krr1ClfJeQ8ozUNbsQyuKB+WQvTCE=;
        b=sw9tHVGbsRxIwTwIW4STTLxz/MP1f+OqrbkjZ9tobORVflGucfoNsMFQk9GegEYkjh
         SNh/3Wg+Ym2XQZSApkhyz4Rv7lR1Xed5kqFuTij4jECca13VqUDltU+j9Kuoek4wbTvw
         KjBVSshLKGXq/4nV4nDLOIfCr96Ma1VegOZ7fPS0A91Iqsk6kqNRn/1Wb9qtVnvzPQWt
         wKhTUrljU5Ul/7uTp39XQCcv/LICn/a3DPU/UUbf1qAbOSa+bi8CRBDFKSYxqhkJnGD8
         J/AcEwdu8iQyg8U8+0WC7AvzGt3ttvpyH/IOIC+nTJwQ/OCP9dYWR7hibdiU2xCTa5SP
         +T2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTOWlHt+axp2m88MeMBWFVOX10kIpRTt3iooi7W8Wqi2MnSVnQeTcZdljfRbOam39BBBWjN42a0rib/RL+4337NjgWzzsAJrXegO327rFA
X-Gm-Message-State: AOJu0Yy2CsbQKRYIt2fL0VcuzcGjmAG4rLWtGFsuiKUn0oZ9Vie4l0FX
	+atQRAVNcQzTWTC5J+UbSNnc3eFF786X7om+MuxHXGprqvWfoKx2CD+6M9lJdKd4/RffWHoXkPt
	ddpFLuOBJCLm4XaUPs1cNR0XfDxM=
X-Google-Smtp-Source: AGHT+IGL/ZuNDW+YAA14KxvITUONfWERjFMqYTVlIMjA2c3NxTdOFX1JFpnSxqA19fMs4gI4skjktyw1RgBSXBjql7I=
X-Received: by 2002:a17:90b:78b:b0:2a2:8a0e:1b81 with SMTP id
 l11-20020a17090b078b00b002a28a0e1b81mr3277609pjz.30.1712256210175; Thu, 04
 Apr 2024 11:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud> <20240404153258.GA852748@dev-arch.thelio-3990X>
In-Reply-To: <20240404153258.GA852748@dev-arch.thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Apr 2024 20:42:48 +0200
Message-ID: <CANiq72kSfC2j07mAaV591i4kDwejWRYcFTvASgQmNnHVe5ZwCw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_114336_160272_CB10650B 
X-CRM114-Status: GOOD (  18.73  )
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

T24gVGh1LCBBcHIgNCwgMjAyNCBhdCA1OjMz4oCvUE0gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEFja2VkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
aGFuQGtlcm5lbC5vcmc+CgpUaGFua3MhCgo+IEl0IHNlZW1zIGxpa2UgdGhpcyB3b24ndCBiZSBm
b3Jnb3R0ZW4gYWJvdXQgYnV0IGlmIHRoZXJlIGlzIG5vdCBhbHJlYWR5Cj4gYW4gaXNzdWUgb3Bl
biBmb3IgdGhpcyBzb21ld2hlcmUsIGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBvbmUsIHNpbmNl
IHdlCj4gb2J2aW91c2x5IHdhbnQgdGhpcyBmb3IgYm90aCBDIGFuZCBSdXN0IGNvZGUuCgpXZSB0
cmFjayB0aGUgdW5zdGFibGUgZmVhdHVyZShzKSBhdApodHRwczovL2dpdGh1Yi5jb20vUnVzdC1m
b3ItTGludXgvbGludXgvaXNzdWVzLzIgKEkganVzdCBtb3ZlZCB0aGlzCm9uZSB0aGVyZSBzaW5j
ZSBpdCBpcyBjbG9zZSB0byByZWFkeSwgYnV0IGl0IHdhcyBpbiAjMzU1IHByZXZpb3VzbHksCmFu
ZCBjbGVhbmVkIHRoaW5ncyB1cCBhIGJpdCkuCgpPbiB0aGUgUnVzdCBzaWRlLCBJIHRoaW5rIHRo
ZSBtYWluIG9uZSBpcwpodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL3J1c3QvaXNzdWVzLzg5
NjUzLgoKSXQgaW5jbHVkZXMgS0NGSSwgYnV0IGl0IGlzIG1pc3NpbmcgTWF0dGhldydzIFBScyBm
b3IgS0NGSSBldGMuIEkKYWRkZWQgYSBsaW5rIHRvIGdldCB0aG9zZSBpc3N1ZXMvUFJzIChvciBo
b3BlZnVsbHkgbW9zdCBvZiB0aGVtKToKaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0
L3B1bGxzP3E9aXMlM0FwcitjZmkrbGFiZWwlM0FQRy1leHBsb2l0LW1pdGlnYXRpb25zKy1sYWJl
bCUzQXJvbGx1cAoKV2UgY291bGQgY3JlYXRlIGFuIGV4cGxpY2l0L2NvbmNyZXRlIGlzc3VlIGZv
ciByZW1vdmluZyB0aGUgYGRlcGVuZHMKb24gIWAgd2hlbiBNYXR0aGV3IHNlbmRzIHRoZSBwYXRj
aGVzLCB0aG91Z2guCgo+IEFzIGEgZ2VuZXJhbCBtZXRhIGNvbW1lbnQgbm90IGRpcmVjdGVkIGF0
IGFueW9uZSBpbiBwYXJ0aWN1YWxyLCBJIHRoaW5rCj4gdGhlc2UgJ2RlcGVuZHMgb24gIScgc2hv
dWxkIGFsbCBoYXZlIHNvbWUgc29ydCBvZiBjb21tZW50IG9yIGRlc2NyaXB0aW9uCj4gYXMgdG8g
d2h5IHRoZXkgYXJlIGRpc2FibGVkLiBJIGNhbiBpbmZlciBmcm9tIG1vc3Qgb2YgdGhlbSBidXQg
aXQgd291bGQKPiBzdGlsbCBiZSBnb29kIHRvIGJlIGV4cGxpY2l0LCBlc3BlY2lhbGx5IHNpbmNl
IHNvbWVvbmUgbWlnaHQgd2FudCB0bwo+IHdvcmsgb24gZml4aW5nIHRoZSBvbmVzIHRoYXQgYXJl
IGR1ZSB0byBtaXNzaW5nIHN1cHBvcnQgYW5kIHN1Y2guCgpUaGF0IGlzIGRlZmluaXRlbHkgYSBn
b29kIGlkZWEuIEFuIGFsdGVybmF0aXZlIGNvdWxkIGJlIGxpbmtpbmcgYW4KaXNzdWUgaW5zdGVh
ZCAocGVyaGFwcyBjb25jcmV0ZSBvbmVzIGZvciB0aGF0LCBpLmUuIHlvdXIgb3RoZXIgaWRlYQph
Ym92ZSkgc28gdGhhdCB3ZSBjYW4gdXBkYXRlIHRoZSBzdGF0dXMgZXRjLiBlYXNpbHkuCgpDaGVl
cnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=

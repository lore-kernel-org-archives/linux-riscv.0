Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A651EC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLER3GpZLj3Yf1Z/5JJjikbDrd+zMEiT+pEiMkwrJLY=; b=QlFrtAGWOrPSqE
	l5qmY2SMZ7B9xyjd6sj+5JYGLSy4WndqxNv+uxyp57hNjAiuhQU9fcSSuR48y+EjLnMnWZBYbBhQ3
	Gk06Ax4YlypBeaeeoPgEJi83xEIgYrLgxyAHo64nbKMbQ3Bav/Pk4XMuL50/BpRgKMROVb9Oy+8rx
	EzdpdNxeAoY07omsmhylU0QOgaIOhlihfOIYFtpGh9nPOXvVhkXjfHmNHpVXhD9CtX9EalZuHUcV8
	jXtjDUWAH+p88QSgE/883MEOcDK5AO1DuMQ+hCxQaxhoxANBwdZLR58PCJtYvZ37HwpaVwV0XAkqe
	5HR07KKS5Tdz6QTkRxPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nycDA-008RC7-J7; Tue, 07 Jun 2022 16:37:44 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nycCz-008RB2-Ip
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 16:37:35 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31336535373so31011517b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jun 2022 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l+dfyGXg71t6EG1I1B0LTDArA2xlLZtV5Fm9wbpRGuw=;
        b=VJO8PzyV5CICNSpQOyZZZHG0ePKdf2Oi1DgI9XQItzmtY3sgJzWhpI/fJzOM3fAfDa
         IZYCQMcLILyqzDnXFShQ95qW8YuteG/uAzuI3fhwpD2RCyVwuXX0Qmu6WEfwiVUNaDYP
         sEUY7dmZVsdPlV927UMTZdPZZ/rhzy3BJ6sTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l+dfyGXg71t6EG1I1B0LTDArA2xlLZtV5Fm9wbpRGuw=;
        b=PMyxv+5vS/0QGSxGuW1771by4im22xR9qr/ugKs8Z3KdW8g5BF8nijBeYMlm7/04T2
         vw0P/4WB4O8l8uffD7mBuotl6CLW0PVikTcLbpj+uVbEaMId4eRoH+fwxDSaPdYcBkTZ
         hmS//OwqwU7m2Ft4oscUpgaub52DU3gGqM08zdM8aHMMq2iNgqvr8a43K9gZZwRFE1kP
         0VRBcHlVPTmlcFQAN2Bywf1qF4i2jTWFvayR9pracqYSnR0aEmmGylSkh86D+NgvQY2r
         tjhT1Uf5IHir/Zx5uVe5EjNtIGjOEvoBjh0io0+ki9ANrq8WKCC0vuz+o8T+J0+sp6YQ
         odog==
X-Gm-Message-State: AOAM532eunFBzZ8FajZaSreUfqS/4XNTvxR8WAui6k1eIVdxqF21PGvO
	zUiwu0yVva4vsVVWSF/wGg6bKbXGcxAAOJELIwxY
X-Google-Smtp-Source: ABdhPJwfmmI65JOMj5cv1kXrR4819PlxuXlEbS1ungDbRjbNtZYPjbef+zuvALGG6jZL+m0qcjpdAaCnQN9rMKr66qc=
X-Received: by 2002:a05:690c:28b:b0:30c:bcc2:240d with SMTP id
 bf11-20020a05690c028b00b0030cbcc2240dmr33841028ywb.19.1654619850904; Tue, 07
 Jun 2022 09:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220607131648.29439-1-nikita.shubin@maquefel.me> <20220607131648.29439-2-nikita.shubin@maquefel.me>
In-Reply-To: <20220607131648.29439-2-nikita.shubin@maquefel.me>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 7 Jun 2022 09:37:19 -0700
Message-ID: <CAOnJCULuQw2E3cD5KQKVs8EbcbPPeJQDqvikagxnkDSH+UWqjQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] RISC-V: Create unique identification for SoC PMU
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Genevieve Chan <genevieve.chan@starfivetech.com>, 
	=?UTF-8?B?Sm/Do28gTcOhcmlvIERvbWluZ29z?= <joao.mario@tecnico.ulisboa.pt>, 
	Nikita Shubin <n.shubin@yadro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM PMU PROFILING AND DEBUGGING" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_093733_932534_FEB46797 
X-CRM114-Status: GOOD (  25.46  )
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

T24gVHVlLCBKdW4gNywgMjAyMiBhdCA2OjE3IEFNIE5pa2l0YSBTaHViaW4gPG5pa2l0YS5zaHVi
aW5AbWFxdWVmZWwubWU+IHdyb3RlOgo+Cj4gRnJvbTogSm/Do28gTcOhcmlvIERvbWluZ29zIDxq
b2FvLm1hcmlvQHRlY25pY28udWxpc2JvYS5wdD4KPgo+IFRoZSBTQkkgUE1VIHBsYXRmb3JtIGRy
aXZlciBkaWQgbm90IHByb3ZpZGUgYW55IGlkZW50aWZpY2F0aW9uIGZvcgo+IHBlcmYgZXZlbnRz
IG1hdGNoaW5nLiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBuZXcgc3lzZnMgZmlsZSBpbnNpZGUg
dGhlCj4gcGxhdGZvcm0gZGV2aWNlIChzb2M6cG11L2lkKSBmb3IgcG11IGlkZW50aWZpY2F0aW9u
Lgo+Cj4gVGhlIGlkZW50aWZpY2F0aW9uIGlzIGEgNjQtYml0IHZhbHVlIGdlbmVyYXRlZCBhczoK
PiBbNjMtMzJdOiBtdmVuZG9yaWQ7Cj4gWzMxXTogbWFyY2hpZFtNU0JdOwo+IFszMC0xNl06IG1h
cmNoaWRbMTUtMF07Cj4gWzE1LTBdOiBtaW1waWRbMTVNU0JzXTsKPgoKVGhpcyBpcyBub3QgZW50
aXJlbHkgY29ycmVjdCBhcyBtYXJjaGlkIG9yIG1pbXBpZCBjYW4gYmUgTVhMRU4uIFRoZQplbmNv
ZGluZyBzY2hlbWUgaXMgbGVmdCB1cHRvIHRoZQp2ZW5kb3IuIFdlIGNhbiBub3QgYXNzdW1lIGFu
eXRoaW5nIGFib3V0IGl0LgoKVGhlIHB1cnBvc2Ugb2YgdGhlIFBNVSBJRCBpcyB0byBkaXN0aW5n
dWlzaCBiZXR3ZWVuIGRpZmZlcmVudAp2ZW5kb3JzL2dlbmVyYXRpb25zLiBUaGUgcGVyZiB0b29s
IGV4cGVjdHMKYSBqc29uIHN0cmluZy4KSSB0aGluayB5b3UgY2FuIGp1c3Qga2VlcCBhbGwgdGhl
c2UgMyByZWdpc3RlcnMgaW50byB0aGUgSlNPTiBzdHJpbmcKYXMgaXQgaXMgdG8gYXZvaWQgYW55
IHBpdGZhbGxzIHdpdGggdmVuZG9yIHdlaXJkbmVzcy4KCj4gVGhlIENTUnMgYXJlIGRldGFpbGVk
IGluIHRoZSBSSVNDLVYgcHJpdmlsZWdlZCBzcGVjIFsxXS4KPiBUaGUgbWFyY2hpZCBpcyBzcGxp
dCBpbiBNU0IgKyAxNUxTQnMsIGR1ZSB0byB0aGUgTVNCIGJlaW5nIHVzZWQgZm9yCj4gb3Blbi1z
b3VyY2UgYXJjaGl0ZWN0dXJlIGlkZW50aWZpY2F0aW9uLgo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb8OjbyBNw6Fy
aW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0Pgo+IFRlc3RlZC1ieTog
TmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9zYmkuYyAgICAgIHwgIDMgKysrCj4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMg
fCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFu
Z2VkLCA1MCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+IGluZGV4IDc3NWQzMzIyYjQyMi4uNTBk
ZDliNmVjYzllIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiBAQCAtNjI3LDE2ICs2MjcsMTkgQEAgbG9uZyBzYmlf
Z2V0X212ZW5kb3JpZCh2b2lkKQo+ICB7Cj4gICAgICAgICByZXR1cm4gX19zYmlfYmFzZV9lY2Fs
bChTQklfRVhUX0JBU0VfR0VUX01WRU5ET1JJRCk7Cj4gIH0KPiArRVhQT1JUX1NZTUJPTChzYmlf
Z2V0X212ZW5kb3JpZCk7Cj4KPiAgbG9uZyBzYmlfZ2V0X21hcmNoaWQodm9pZCkKPiAgewo+ICAg
ICAgICAgcmV0dXJuIF9fc2JpX2Jhc2VfZWNhbGwoU0JJX0VYVF9CQVNFX0dFVF9NQVJDSElEKTsK
PiAgfQo+ICtFWFBPUlRfU1lNQk9MKHNiaV9nZXRfbWFyY2hpZCk7Cj4KPiAgbG9uZyBzYmlfZ2V0
X21pbXBpZCh2b2lkKQo+ICB7Cj4gICAgICAgICByZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklf
RVhUX0JBU0VfR0VUX01JTVBJRCk7Cj4gIH0KPiArRVhQT1JUX1NZTUJPTChzYmlfZ2V0X21pbXBp
ZCk7Cj4KPiAgc3RhdGljIHZvaWQgc2JpX3NlbmRfY3B1bWFza19pcGkoY29uc3Qgc3RydWN0IGNw
dW1hc2sgKnRhcmdldCkKPiAgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11
X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IGluZGV4IGExMzE3YTQ4MzUx
Mi4uMTVhYjNkYzY4ZTdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMKPiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gQEAgLTY5Myw2ICs2OTMs
NDYgQEAgc3RhdGljIGludCBwbXVfc2JpX3NldHVwX2lycXMoc3RydWN0IHJpc2N2X3BtdSAqcG11
LCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGUKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4K
PiArc3RhdGljIHVpbnQ2NF90IHBtdV9zYmlfZ2V0X3BtdV9pZCh2b2lkKQo+ICt7Cj4gKyAgICAg
ICB1bmlvbiBzYmlfcG11X2lkIHsKPiArICAgICAgICAgICAgICAgdWludDY0X3QgdmFsdWU7Cj4g
KyAgICAgICAgICAgICAgIHN0cnVjdCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdWludDE2
X3QgaW1wOjE2Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGFyY2g6MTY7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgdmVuZG9yOjMyOwo+ICsgICAgICAgICAg
ICAgICB9Owo+ICsgICAgICAgfSBwbXVpZDsKPiArCj4gKyAgICAgICBwbXVpZC52YWx1ZSA9IDA7
Cj4gKyAgICAgICBwbXVpZC52ZW5kb3IgPSAodWludDMyX3QpIHNiaV9nZXRfbXZlbmRvcmlkKCk7
Cj4gKyAgICAgICBwbXVpZC5hcmNoID0gKHNiaV9nZXRfbWFyY2hpZCgpID4+ICg2MyAtIDE1KSAm
ICgxIDw8IDE1KSkgfCAoc2JpX2dldF9tYXJjaGlkKCkgJiAweDdGRkYpOwo+ICsgICAgICAgcG11
aWQuaW1wID0gKHNiaV9nZXRfbWltcGlkKCkgPj4gMTYpOwo+ICsKPiArICAgICAgIHJldHVybiBw
bXVpZC52YWx1ZTsKPiArfQo+ICsKPiArc3RhdGljIHNzaXplX3QgcG11X3NiaV9pZF9zaG93KHN0
cnVjdCBkZXZpY2UgKmRldiwKPiArICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1
dGUgKmF0dHIsIGNoYXIgKmJ1ZikKPiArewo+ICsgICAgICAgaW50IGxlbjsKPiArCj4gKyAgICAg
ICBsZW4gPSBzcHJpbnRmKGJ1ZiwgIjB4JWxseFxuIiwgcG11X3NiaV9nZXRfcG11X2lkKCkpOwo+
ICsgICAgICAgaWYgKGxlbiA8PSAwKQo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIm15
ZHJ2OiBJbnZhbGlkIHNwcmludGYgbGVuOiAlZG4iLCBsZW4pOwo+ICsKPiArICAgICAgIHJldHVy
biBsZW47Cj4gK30KPiArCj4gK3N0YXRpYyBERVZJQ0VfQVRUUihpZCwgU19JUlVHTyB8IFNfSVdV
U1IsIHBtdV9zYmlfaWRfc2hvdywgMCk7Cj4gKwo+ICtzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAq
cG11X3NiaV9hdHRyc1tdID0gewo+ICsgICAgICAgJmRldl9hdHRyX2lkLmF0dHIsCj4gKyAgICAg
ICBOVUxMCj4gK307Cj4gKwo+ICtBVFRSSUJVVEVfR1JPVVBTKHBtdV9zYmkpOwo+ICsKPiAgc3Rh
dGljIGludCBwbXVfc2JpX2RldmljZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUgPSBOVUxMOwo+IEBAIC03Mjks
NiArNzY5LDEzIEBAIHN0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIHBtdS0+Y3RyX2NsZWFyX2lkeCA9IHBtdV9zYmlf
Y3RyX2NsZWFyX2lkeDsKPiAgICAgICAgIHBtdS0+Y3RyX3JlYWQgPSBwbXVfc2JpX2N0cl9yZWFk
Owo+Cj4gKyAgICAgICByZXQgPSBzeXNmc19jcmVhdGVfZ3JvdXAoJnBkZXYtPmRldi5rb2JqLCAm
cG11X3NiaV9ncm91cCk7Cj4gKyAgICAgICBpZiAocmV0KSB7Cj4gKyAgICAgICAgICAgICAgIGRl
dl9lcnIoJnBkZXYtPmRldiwgInN5c2ZzIGNyZWF0aW9uIGZhaWxlZFxuIik7Cj4gKyAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICB9Cj4gKyAgICAgICBwZGV2LT5kZXYuZ3JvdXBz
ID0gcG11X3NiaV9ncm91cHM7Cj4gKwo+ICAgICAgICAgcmV0ID0gY3B1aHBfc3RhdGVfYWRkX2lu
c3RhbmNlKENQVUhQX0FQX1BFUkZfUklTQ1ZfU1RBUlRJTkcsICZwbXUtPm5vZGUpOwo+ICAgICAg
ICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtLQo+IDIuMzUuMQo+
CgoKLS0KUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK

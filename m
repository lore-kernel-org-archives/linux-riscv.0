Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F7CE7A81
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 22:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Tskdoudq21lrFaOz+bKTon/HlJ30A/I4AD81OKPm4w=; b=oseSMPI6Jddeyb
	Xck0loBghIj7xSXAirkJtntKMPvGpj6ZNpJKd5aHQE+qvplYERC7klb+WRGNOCJlKyt9/u810MguW
	Qz84KtVavwnuqAH5YlonGlkQwejzrA50sl8HHZf8ibIZqBaRBcWJZ+fF0ve7BTTu/56YvqDFJ97+L
	+X5ssASzm1JcoS32iIhWSen06Xm4sPHsSspKoopTYwslgM6lL/rFoMXD1645ewjFUVXzSYf0Zx5aw
	MRqciNu/ltypjDRE/Ptc6bggG/hPTfRi3SJUzX86NmWyMgfrTZwgjqq3oeFTcaNmfla7SmDCd0Fi5
	UtmjG9j0x9NCVB1Ap4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjoxA-009wD0-2V;
	Fri, 22 Sep 2023 22:48:52 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjox7-009wC5-0R
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 22:48:50 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-45271a44cc4so1327351137.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695422927; x=1696027727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRzCTvAX8lq6ewJO7NcrsXgOFKTlOn5VfN4T0R6NmVE=;
        b=GD3rsjwuCuw6QuVnFcastW13T0W+ayzt3vFLMPgwqhOutdgvK77EkgKP+jbMusCBP+
         qvY/cj8E4G5Zsfp6gtKpJwfZtODRRBevrgXlWQcnxU+qzdw0G+zkkzrbwo6yLPv/eKrf
         XZLEhK+d14lQMk5vFbcXyEOQsR7MwQYgKWOfoFIEIvGK8Qg5SMuMiijhfJV/dXD+XHlB
         b5I/Mz22TFFf7bQ20zkE4gvnBWXH5f66KnkMFHHtwfBTlgAmqb7SvQJInV2ATnhSCOwo
         PBnAg5HswSTtFWhXhTzpmKHICDyJDHZOC8RzyEddhUA3ScAoF9pOtM1ajSIpaNk7uK3V
         bxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695422927; x=1696027727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRzCTvAX8lq6ewJO7NcrsXgOFKTlOn5VfN4T0R6NmVE=;
        b=F3FXaO5qV70T+wWV5iXWZQS0viwSAF8gghZ8EsurHFyHjhFPCIYiOMLmTLQnCaafpb
         XcFsHIf0R0KihKI2ScYCIcthZHiwdMK/ZyELBuK4T7v/1rdRw4PkxaGqUUYX8f7XmhNs
         iKlqdnw7ph5fH7WFAuGyYb/wy4xdzBlJcrsMd95ketfYt4F44IqIWsoi/X4/EKLdr2Bo
         uGNjJeE4vOLosf3r1+t44tzRigfXzhzyEYpMUcWpwIX1AniKtXq1XqDZJ5lNZjSoI4xe
         oNF8dw3dQNa19b2/NJVHJ+LE/R0qXw8IssLaRvVTKn/uZ4j9OkXIqSaG1WpQkxJ8QHKE
         h6eQ==
X-Gm-Message-State: AOJu0YwqzWdT2FDCQeuxAQsgXbtOpw/Hhsf8hrTh70kW9ehWhCK+KdTR
	44u7yxyYxtQbiM2H/v2nyS25HJJ/0WnQikvU/h8=
X-Google-Smtp-Source: AGHT+IF1gUPUngEFORaH938h7YzS+JWWpSVyKmix417AKosTTVqEnfAzpMoyZWQpN/BKfzgbZwWB7ubXlAqBNOi+HEI=
X-Received: by 2002:a67:ef99:0:b0:452:951f:2bb1 with SMTP id
 r25-20020a67ef99000000b00452951f2bb1mr838983vsp.29.1695422927511; Fri, 22 Sep
 2023 15:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com> <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
In-Reply-To: <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 22 Sep 2023 17:48:21 -0500
Message-ID: <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
To: Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_154849_200458_8768662F 
X-CRM114-Status: GOOD (  25.51  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMjowOOKAr1BNIFJvYmVydCBOZWxzb24gPHJvYmVydGNu
ZWxzb25AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgU2VwIDIxLCAyMDIzIGF0IDg6NTHi
gK9QTSBEcmV3IEZ1c3RpbmkgPGRmdXN0aW5pQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgZU1NQyBvbiB0aGUgQmVhZ2xlViBBaGVh
ZCBhbmQgdGhlCj4gPiBTaXBlZWQgTGljaGVlUGkgNEEuIFRoaXMgYWxsb3dzIHRoZSBrZXJuZWwg
dG8gYm9vdCB3aXRoIHRoZSByb290ZnMgb24KPiA+IGVNTUMuCj4gPgo+ID4gSSB0ZXN0ZWQgb24g
dG9wIG9mIHY2LjYtcmMyIHdpdGggdGhpcyBjb25maWcgWzFdLiBJIHdhcyBhYmxlIHRvIGJvb3QK
PiA+IGJvdGggdGhlIEFoZWFkIFsyXSBhbmQgTFBpNGEgWzNdIGZyb20gZU1NQy4gVGhlIGZvbGxv
d2luZyBwcmVyZXF1aXNpdGVzCj4gPiBhcmUgcmVxdWlyZWQ6Cj4gPgo+ID4gICBbUEFUQ0ggdjJd
IHJpc2N2OiBkdHM6IHRoZWFkOiBzZXQgZG1hLW5vbmNvaGVyZW50IHRvIHNvYyBidXMgWzRdCj4g
Pgo+ID4gSSBwdXNoZWQgYSBicmFuY2ggWzVdIHdpdGggdGhpcyBwYXRjaCBzZXJpZXMgYW5kIHRo
ZSBhYm92ZSBwYXRjaCBmb3IKPiA+IHRob3NlIHRoYXQgZmluZCBhIGdpdCBicmFuY2ggZWFzaWVy
IHRvIHRlc3QuCj4gPgo+ID4gUGxlYXNlIG5vdGUgdGhhdCBvbmx5IHRoZSBNTUMgY29udHJvbGxl
ciBjb25uZWN0ZWQgdG8gdGhlIGVNTUMgZGV2aWNlCj4gPiBpcyBlbmFibGVkIGluIHRoZSBkZXZp
Y2UgdHJlZXMgZm9yIHRoZXNlIHR3byBib2FyZHMuIEkgZGlkIG5vdCB5ZXQKPiA+IGF0dGVtcHQg
dG8gY29uZmlndXJlIGFuZCB1c2UgdGhlIG1pY3JvU0QgY2FyZCBzbG90LiBNeSBwcmVmZXJlbmNl
IGlzIHRvCj4gPiBhZGRyZXNzIHRoYXQgaW4gYSBmdXR1cmUgcGF0Y2ggc2VyaWVzLgo+ID4KPiA+
IFJlZmVyZW5jZXM6Cj4gPiBbMV0gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vcGRwNy81ZmJkY2Yy
YTY1ZWIxYWJkZDNhMjlkNTE5YzE5Y2RkMgo+ID4gWzJdIGh0dHBzOi8vZ2lzdC5naXRodWIuY29t
L3BkcDcvOTFhODAxYTVmOGQxMDcwYzUzNTA5ZWRhOTgwMGFkNzgKPiA+IFszXSBodHRwczovL2dp
c3QuZ2l0aHViLmNvbS9wZHA3LzE0NDVjM2M5OTFlODhmZDY5YzYwMTY1Y2VmNjU3MjZhCj4gPiBb
NF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA5MTIwNzIyMzIuMjQ1
NS0xLWpzemhhbmdAa2VybmVsLm9yZy8KPiA+IFs1XSBodHRwczovL2dpdGh1Yi5jb20vcGRwNy9s
aW51eC90cmVlL2I0L3RoMTUyMC1tbWMKPgo+IFRoaXMgcGF0Y2hzZXQgY2FtZSBvdXQgdmVyeSBu
aWNlIQo+Cj4gdjYuNi1yYzIgd2l0aCBMYXN0IFJGQyB2MjoKPgo+IFsgICAgNC4wNjY2MzBdIG1t
YzA6IFNESENJIGNvbnRyb2xsZXIgb24gZmZlNzA4MDAwMC5tbWMKPiBbZmZlNzA4MDAwMC5tbWNd
IHVzaW5nIFBJTwo+Cj4gZGViaWFuQEJlYWdsZVY6fiQgc3VkbyBoZHBhcm0gLXRUIC9kZXYvbW1j
YmxrMAo+Cj4gL2Rldi9tbWNibGswOgo+ICBUaW1pbmcgY2FjaGVkIHJlYWRzOiAgIDE1MTYgTUIg
aW4gIDIuMDAgc2Vjb25kcyA9IDc1OC4wOSBNQi9zZWMKPiAgVGltaW5nIGJ1ZmZlcmVkIGRpc2sg
cmVhZHM6ICA4NCBNQiBpbiAgMy4wMSBzZWNvbmRzID0gIDI3Ljk0IE1CL3NlYwo+Cj4gdnMgdjYu
Ni1yYzIgd2l0aCB0aGlzIHBhdGNoc2V0Ogo+Cj4gIFsgICAgNC4wOTY4MzddIG1tYzA6IFNESENJ
IGNvbnRyb2xsZXIgb24gZmZlNzA4MDAwMC5tbWMKPiBbZmZlNzA4MDAwMC5tbWNdIHVzaW5nIERN
QQo+Cj4gZGViaWFuQEJlYWdsZVY6fiQgc3VkbyBoZHBhcm0gLXRUIC9kZXYvbW1jYmxrMAo+Cj4g
L2Rldi9tbWNibGswOgo+ICBUaW1pbmcgY2FjaGVkIHJlYWRzOiAgIDE1ODAgTUIgaW4gIDIuMDAg
c2Vjb25kcyA9IDc5MC45NyBNQi9zZWMKPiAgVGltaW5nIGJ1ZmZlcmVkIGRpc2sgcmVhZHM6IDQx
OCBNQiBpbiAgMy4wMCBzZWNvbmRzID0gMTM5LjExIE1CL3NlYwoKRHJldyBwb2ludGVkIG91dCBv
biBTbGFjaywgdGhpcyB3YXMgbm90IHF1aXRlIHJpZ2h0Li4gQWZ0ZXIgbW9yZQpkaWdnaW5nIGJ5
IERyZXcsIENPTkZJR19ETUFfR0xPQkFMX1BPT0wgaXMgY2F1c2luZyBhIERNQSBsaW1pdGF0aW9u
CndpdGggdGhlIG11bHRpcGxhdGZvcm0gZGVmY29uZmlnLiBzbyB3aXRoLAoKLi9zY3JpcHRzL2Nv
bmZpZyAtLWRpc2FibGUgQ09ORklHX0FSQ0hfUjlBMDdHMDQzCgoodG8gcmVtb3ZlIENPTkZJR19E
TUFfR0xPQkFMX1BPT0wpLi4uIGFub3RoZXIgMnggaW4gYnVmZmVyZWQgcmVhZHMuLgoKWyAgICA0
LjA1OTI0Ml0gbW1jMDogU0RIQ0kgY29udHJvbGxlciBvbiBmZmU3MDgwMDAwLm1tYwpbZmZlNzA4
MDAwMC5tbWNdIHVzaW5nIEFETUEgNjQtYml0CgpkZWJpYW5AQmVhZ2xlVjp+JCBzdWRvIGhkcGFy
bSAtdFQgL2Rldi9tbWNibGswCgovZGV2L21tY2JsazA6CiBUaW1pbmcgY2FjaGVkIHJlYWRzOiAg
IDE2MDAgTUIgaW4gIDIuMDAgc2Vjb25kcyA9IDgwMC45MyBNQi9zZWMKIFRpbWluZyBidWZmZXJl
ZCBkaXNrIHJlYWRzOiA4OTIgTUIgaW4gIDMuMDAgc2Vjb25kcyA9IDI5Ny4wNiBNQi9zZWMKClJl
Z2FyZHMsCgotLSAKUm9iZXJ0IE5lbHNvbgpodHRwczovL3Jjbi1lZS5jb20vCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

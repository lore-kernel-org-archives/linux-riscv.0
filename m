Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07836C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/Mn+8T2qEYJUS6trMZ7QErqiD8oEpj8JvplpZmGwBA=; b=UvTpipdnxX3TmS
	FdQkOdkjaQTwa7GGTtxn0gIHjsUt8yMWkKF3HnnYz6zECoJttMqVJIC612LnDbimrNBu3SQGYgPIs
	LouwigMak0jFP2WmFNY/9JWuai22Q0Bm5u7dnKzOSdIOuSy7SusUo/BGUls4ggOmjTxywk0ycjSY+
	tMILGUgt08uNPBaVKpLhNT/FnYfFEnQY3yybP2xztOWPPyHqVylAsd0JDSbq3PjRLt0NL5q345wPr
	WeS5Afd4wXa7571/bjO8eOlPMOomvXSG+q3POqsV4fXby9lyllmCMbA7zvm3mHc/IGrpJ5zFGq7JD
	alqmmL6XGMsVrdyEshMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Xco-007U48-0n;
	Fri, 24 Nov 2023 14:57:46 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Xck-007U3Q-0X;
	Fri, 24 Nov 2023 14:57:43 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b83fc26e4cso1197461b6e.2;
        Fri, 24 Nov 2023 06:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700837861; x=1701442661; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McONVnnVXBzrRAKYWOt6koN2Gq2PdEQz7Bj2evyzgvA=;
        b=it/wEbhpoykXc6ETD2p6tkd5xXHoa9w3K+0i98nO1QSZKGbFyXvBgxttKp637q0/+2
         ozkwF5xb5ySKw+bNdZpsWkgR3UCHECmMna04pERHaJscOhuZy7qf5OZOzxxNPtSCTAtj
         5EGfpqOXAiONS+3Dl/LM/o1LiS371Se3EegFp+E/FT5SEhLBfq+RMv/Il7AU9t6TkkJb
         IajGVpBhtFucqCC7Yc4tLnxqSIi2DGXJ/ToRkz66DzDLuWwu1bJnWaKRzFSVMS/Ngujt
         uCzDPbANyd6G2kVuQ9o9uwCFqFtIOeyF/xLMzYMgLBwqdFPR/8aVWXCxm0MsUwua1vV7
         OgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700837861; x=1701442661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McONVnnVXBzrRAKYWOt6koN2Gq2PdEQz7Bj2evyzgvA=;
        b=sy7GI+7MCGwWBBABAoriAjmaMXAxsK8nX3V84qH+A9RlXahXoAnZucaz/ywaS61R/u
         ds1OGLtpiWMmBwK4jPqjIGwue2uBegdS67Kz3MJbWu1RQChh59GU4g9IiBkRqPkJYFEh
         mswNzndcW2wmhALpywZzshcIbiQlW7S9qmaolVXIsU8ItGA+U2mte77+npMiiSXzQeus
         lOVqP1Qq0Sh+G7tmIEQ3fJyKqjmDmuYPlHrL6spi2Cu+uzp3vg1sb6Wc75iOJXsm9UXK
         H5vyX796Plrt9ej3bjQ3kypm7YjFHVgX/0ojHK8waTfI7mOmiIwlHa+8OMD41tr9R0np
         Gqtw==
X-Gm-Message-State: AOJu0YzEUC668gHuXUxlHPhBDFDEkZ4SacejAlsR+gi0kuGdTStWgcoZ
	E+22OOMCGS9M4t3z5/Ro8xwy2Xgc4G9eusPt5TA=
X-Google-Smtp-Source: AGHT+IFyw54KdvX5NZtpjxNOebZ/DdQWx5nul4bTgzQLtaMiqrgW8bakiEzPtq/Ulcd5S/faM446P2Jo1/UeRTY/fHI=
X-Received: by 2002:a05:6358:9198:b0:16d:f02d:d394 with SMTP id
 j24-20020a056358919800b0016df02dd394mr2754632rwa.14.1700837860947; Fri, 24
 Nov 2023 06:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-2-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-2-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 14:57:15 +0000
Message-ID: <CA+V-a8tS0hE_aDEk6RwhhjjEPP-OQpg1zuRbFrK7JdHtLCUTYA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] riscv: errata: Rename defines for Andes
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_065742_202911_CF0628FB 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMTI6MTjigK9QTSBZdSBDaGllbiBQZXRlciBMaW4KPHBl
dGVybGluQGFuZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4gVXNpbmcgIkFOREVTIiByYXRoZXIgdGhh
biAiQU5ERVNURUNIIiB0byB1bmlmeSB0aGUgbmFtaW5nCj4gY29udmVudGlvbiB3aXRoIGRpcmVj
dG9yeSwgZmlsZSBuYW1lcywgS2NvbmZpZyBvcHRpb25zCj4gYW5kIG90aGVyIGRlZmluaXRpb25z
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUgQ2hpZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBhbmRlc3Rl
Y2guY29tPgo+IFJldmlld2VkLWJ5OiBDaGFybGVzIENpLUp5dW4gV3UgPGRtaW51c0BhbmRlc3Rl
Y2guY29tPgo+IFJldmlld2VkLWJ5OiBMZW8gWXUtQ2hpIExpYW5nIDx5Y2xpYW5nQGFuZGVzdGVj
aC5jb20+Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+Cj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgIC0gTm8gY2hhbmdlCj4gQ2hhbmdlcyB2
MiAtPiB2MzoKPiAgIC0gUmV3cm90ZSBjb21taXQgbWVzc2FnZSAoc3VnZ2VzdGVkIGJ5IENvbm9y
KQo+IENoYW5nZXMgdjMgLT4gdjQ6Cj4gICAtIEluY2x1ZGUgQ29ub3IncyBBY2tlZC1ieSB0YWcK
PiAtLS0KPiAgYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMgICAgICAgfCAxMCArKysr
Ky0tLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCAgIHwgIDQgKyst
LQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcmlkX2xpc3QuaCB8ICAyICstCj4gIGFy
Y2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMgICAgICAgIHwgIDIgKy0KPiAgNCBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KUmV2aWV3ZWQtYnk6IExh
ZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KCkNo
ZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9l
cnJhdGEuYyBiL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jCj4gaW5kZXggMTk3ZGI2
OGNjOGRhLi5kMmUxYWJjYWM5NjcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvYW5k
ZXMvZXJyYXRhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYwo+IEBA
IC0xOCw5ICsxOCw5IEBACj4gICNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gICNpbmNsdWRlIDxhc20v
dmVuZG9yaWRfbGlzdC5oPgo+Cj4gLSNkZWZpbmUgQU5ERVNURUNIX0FYNDVNUF9NQVJDSElEICAg
ICAgIDB4ODAwMDAwMDAwMDAwOGE0NVVMCj4gLSNkZWZpbmUgQU5ERVNURUNIX0FYNDVNUF9NSU1Q
SUQgICAgICAgICAgICAgICAgMHg1MDBVTAo+IC0jZGVmaW5lIEFOREVTVEVDSF9TQklfRVhUX0FO
REVTICAgICAgICAgICAgICAgIDB4MDkwMDAzMUUKPiArI2RlZmluZSBBTkRFU19BWDQ1TVBfTUFS
Q0hJRCAgICAgICAgICAgMHg4MDAwMDAwMDAwMDA4YTQ1VUwKPiArI2RlZmluZSBBTkRFU19BWDQ1
TVBfTUlNUElEICAgICAgICAgICAgMHg1MDBVTAo+ICsjZGVmaW5lIEFOREVTX1NCSV9FWFRfQU5E
RVMgICAgICAgICAgICAweDA5MDAwMzFFCj4KPiAgI2RlZmluZSBBTkRFU19TQklfRVhUX0lPQ1Bf
U1dfV09SS0FST1VORCAgICAgICAxCj4KPiBAQCAtMzIsNyArMzIsNyBAQCBzdGF0aWMgbG9uZyBh
eDQ1bXBfaW9jcF9zd193b3JrYXJvdW5kKHZvaWQpCj4gICAgICAgICAgKiBBTkRFU19TQklfRVhU
X0lPQ1BfU1dfV09SS0FST1VORCBTQkkgRVhUIGNoZWNrcyBpZiB0aGUgSU9DUCBpcyBtaXNzaW5n
IGFuZAo+ICAgICAgICAgICogY2FjaGUgaXMgY29udHJvbGxhYmxlIG9ubHkgdGhlbiBDTU8gd2ls
bCBiZSBhcHBsaWVkIHRvIHRoZSBwbGF0Zm9ybS4KPiAgICAgICAgICAqLwo+IC0gICAgICAgcmV0
ID0gc2JpX2VjYWxsKEFOREVTVEVDSF9TQklfRVhUX0FOREVTLCBBTkRFU19TQklfRVhUX0lPQ1Bf
U1dfV09SS0FST1VORCwKPiArICAgICAgIHJldCA9IHNiaV9lY2FsbChBTkRFU19TQklfRVhUX0FO
REVTLCBBTkRFU19TQklfRVhUX0lPQ1BfU1dfV09SS0FST1VORCwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAwLCAwLCAwLCAwLCAwLCAwKTsKPgo+ICAgICAgICAgcmV0dXJuIHJldC5lcnJvciA/
IDAgOiByZXQudmFsdWU7Cj4gQEAgLTQzLDcgKzQzLDcgQEAgc3RhdGljIGJvb2wgZXJyYXRhX3By
b2JlX2lvY3AodW5zaWduZWQgaW50IHN0YWdlLCB1bnNpZ25lZCBsb25nIGFyY2hfaWQsIHVuc2ln
bmUKPiAgICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfRVJSQVRBX0FOREVTX0NNTykpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPgo+IC0gICAgICAgaWYgKGFyY2hfaWQgIT0g
QU5ERVNURUNIX0FYNDVNUF9NQVJDSElEIHx8IGltcGlkICE9IEFOREVTVEVDSF9BWDQ1TVBfTUlN
UElEKQo+ICsgICAgICAgaWYgKGFyY2hfaWQgIT0gQU5ERVNfQVg0NU1QX01BUkNISUQgfHwgaW1w
aWQgIT0gQU5ERVNfQVg0NU1QX01JTVBJRCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNl
Owo+Cj4gICAgICAgICBpZiAoIWF4NDVtcF9pb2NwX3N3X3dvcmthcm91bmQoKSkKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gaW5kZXggODNlZDI1ZTQzNTUzLi40ZWQyMWE2MjE1
OGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gQEAgLTEyLDggKzEy
LDggQEAKPiAgI2luY2x1ZGUgPGFzbS92ZW5kb3JpZF9saXN0Lmg+Cj4KPiAgI2lmZGVmIENPTkZJ
R19FUlJBVEFfQU5ERVMKPiAtI2RlZmluZSBFUlJBVEFfQU5ERVNURUNIX05PX0lPQ1AgICAgICAg
MAo+IC0jZGVmaW5lIEVSUkFUQV9BTkRFU1RFQ0hfTlVNQkVSICAgICAgICAgICAgICAgIDEKPiAr
I2RlZmluZSBFUlJBVEFfQU5ERVNfTk9fSU9DUCAwCj4gKyNkZWZpbmUgRVJSQVRBX0FOREVTX05V
TUJFUiAxCj4gICNlbmRpZgo+Cj4gICNpZmRlZiBDT05GSUdfRVJSQVRBX1NJRklWRQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcmlkX2xpc3QuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmVuZG9yaWRfbGlzdC5oCj4gaW5kZXggZTU1NDA3YWNlMGMzLi4yZjJi
YjBjODRmOWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZW5kb3JpZF9s
aXN0LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcmlkX2xpc3QuaAo+IEBA
IC01LDcgKzUsNyBAQAo+ICAjaWZuZGVmIEFTTV9WRU5ET1JfTElTVF9ICj4gICNkZWZpbmUgQVNN
X1ZFTkRPUl9MSVNUX0gKPgo+IC0jZGVmaW5lIEFOREVTVEVDSF9WRU5ET1JfSUQgICAgMHgzMWUK
PiArI2RlZmluZSBBTkRFU19WRU5ET1JfSUQgICAgICAgICAgICAgICAgMHgzMWUKPiAgI2RlZmlu
ZSBTSUZJVkVfVkVORE9SX0lEICAgICAgIDB4NDg5Cj4gICNkZWZpbmUgVEhFQURfVkVORE9SX0lE
ICAgICAgICAgICAgICAgIDB4NWI3Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
YWx0ZXJuYXRpdmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMKPiBpbmRleCAz
MTlhMWRhMDM1OGIuLjAxMjhiMTYxYmZkYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9hbHRlcm5hdGl2ZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvYWx0ZXJuYXRpdmUuYwo+
IEBAIC00Myw3ICs0Myw3IEBAIHN0YXRpYyB2b2lkIHJpc2N2X2ZpbGxfY3B1X21mcl9pbmZvKHN0
cnVjdCBjcHVfbWFudWZhY3R1cmVyX2luZm9fdCAqY3B1X21mcl9pbmZvCj4KPiAgICAgICAgIHN3
aXRjaCAoY3B1X21mcl9pbmZvLT52ZW5kb3JfaWQpIHsKPiAgI2lmZGVmIENPTkZJR19FUlJBVEFf
QU5ERVMKPiAtICAgICAgIGNhc2UgQU5ERVNURUNIX1ZFTkRPUl9JRDoKPiArICAgICAgIGNhc2Ug
QU5ERVNfVkVORE9SX0lEOgo+ICAgICAgICAgICAgICAgICBjcHVfbWZyX2luZm8tPnBhdGNoX2Z1
bmMgPSBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYzsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
ICNlbmRpZgo+IC0tCj4gMi4zNC4xCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=

Return-Path: <SRS0=iQdh=H5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9234C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 03:59:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 906BE64D9A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 03:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 906BE64D9A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=INkPcSnsO2D/qwn2Y5OXzpBowLahcw/sQlETUwsifxY=; b=eeBkmfwfoF71XGPsdt15i9+8N
	77zCZ2wriEaR8ksFpZIUO1lCeGdnnp343fpK7qGbgBvknPAqtq80Gu4OpX27sdcTtlooJWGM1Rd8s
	+YIb/eRf18y5GWcpk9XWDZzOP2oZZ7ob5v+wviiSQq7R1HJUzdQFezH9wPNaf5WdVkS2Wi+eGWBOc
	FKrJ+bRXE+1GTYIY2hTkF+JlxUx2QdNUqGKQvTVB9KHxcNggzbvLOkHODMJFh6hlMuwXo033DPVhS
	qF8yv9rKJKsur6CH4dKv0HklZN8FZoHAoQMl2bkO8LiSHXzLhkXQ+Bl7g9l+3Mufj23k8uSFLvi/t
	KQPyjOImA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFqlY-0002Dh-Lt; Sat, 27 Feb 2021 03:59:40 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFqlW-0002D3-Bq
 for linux-riscv@lists.infradead.org; Sat, 27 Feb 2021 03:59:39 +0000
Received: by mail-lj1-x230.google.com with SMTP id u4so12944929ljh.6
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 19:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IozGx7C0T19f0wHA2sRVJGAa+F8rFFKpX1D9A8YR8PU=;
 b=HCQVZ5EjAhlPbe6PMaX7ZUJILWMltz2qOzxlQTW/cLhl4wTjGnAAFQ9DhlsKHlbPoh
 uhreFWU/8syefOSG9GjCSk0NkbeHR5owmvGV6uHWbk4ij2eRQnsGu0Gp0OzBTtGBkRyN
 22tqA9FjtcndeULj4onrEi3jcyHapzSrHghIwcup5y45alrBxDPasblkR4ddZytTmJzf
 P9W2H1RygxjlfJ4KLdg+914UOoZnQeeeSEUbcd2ddMXmOZCXXhAUB/1R4TzwOta3TjRr
 T/+00ElxyBnmBLV6Cx1a23XWFILvofLUstmlM/qyR0YPBisY03vE2xjKFIH8sq5Xb8z+
 F3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IozGx7C0T19f0wHA2sRVJGAa+F8rFFKpX1D9A8YR8PU=;
 b=QBhow4v+OvWcPvGhIjKTsCYtWFuzx5EBndtsv1bOtz8mqdBgbiKmlc3wUTd/kKp6ZG
 0PzMMSEyAoVhGF1h9tLQbGvZm/WrKrcfvtn9I9nYhe43bDy0T/mpfFwYjFgI2jCnrW10
 YuI29EAxHbVg0sf/TgbvteE02L2mn+QHm6qy0e47JPICySwdUjE9yC3Ipj9DLegkoRCJ
 +JqIksVJlBqwtgQUqrzbXvw/hEDfz2lBpIEoTFiy6xYYnSTGppAJIHGNlKuqf5hx5jDX
 FT5MELGoNtQ9fyBkTWuktFIpYXNtjxIHz7dqCzxi/L4X0VZ+dqF7r38NjWawvumpViQS
 +cNQ==
X-Gm-Message-State: AOAM5339f4croeLcJ2Td74G/dy2OQ1s8o+TwqzGaPVne8QDZR9OmL7kR
 i3YEpJRSpolBIxKC15aRVH+diri6H3Xh0I+5l2h8WA==
X-Google-Smtp-Source: ABdhPJyK8PaCQQvdm5VywGcJLUez1h6cE0BTHcn810vx1vEgoHXDoa8wi/rAtvi3X+Xex5Uedewqw0yV+4b4iaTOj1Y=
X-Received: by 2002:a05:651c:15:: with SMTP id
 n21mr3539853lja.284.1614398376751; 
 Fri, 26 Feb 2021 19:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20210221093758.210981-1-anup.patel@wdc.com>
 <20210221093758.210981-2-anup.patel@wdc.com>
 <3a6e2af7-934d-078f-4e19-d4241809e7fb@ghiti.fr>
In-Reply-To: <3a6e2af7-934d-078f-4e19-d4241809e7fb@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 27 Feb 2021 09:29:24 +0530
Message-ID: <CAAhSdy2VPQURW+rCkY7_dWbgqgOU9_MNN5gRurE_bVcjz1k9aQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] RISC-V: Enable CPU_IDLE drivers
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_225938_445385_586BFC68 
X-CRM114-Status: GOOD (  28.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Anup Patel <anup.patel@wdc.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, Liush <liush@allwinnertech.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQWxleCwKCk9uIEZyaSwgRmViIDI2LCAyMDIxIGF0IDY6NDYgUE0gQWxleCBHaGl0aSA8YWxl
eEBnaGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gTGUgMi8yMS8yMSDDoCA0OjM3IEFN
LCBBbnVwIFBhdGVsIGEgw6ljcml0IDoKPiA+IFdlIGZvcmNlIHNlbGVjdCBDUFVfUE0gYW5kIHBy
b3ZpZGUgYXNtL2NwdWlkbGUuaCBzbyB0aGF0IHdlIGNhbgo+ID4gdXNlIENQVSBJRExFIGRyaXZl
cnMgZm9yIExpbnV4IFJJU0MtViBrZXJuZWwuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQ
YXRlbCA8YW51cC5wYXRlbEB3ZGMuY29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3YvS2NvbmZp
ZyAgICAgICAgICAgICAgICB8ICA3ICsrKysrKysKPiA+ICAgYXJjaC9yaXNjdi9jb25maWdzL2Rl
ZmNvbmZpZyAgICAgIHwgIDcgKysrLS0tLQo+ID4gICBhcmNoL3Jpc2N2L2NvbmZpZ3MvcnYzMl9k
ZWZjb25maWcgfCAgNCArKy0tCj4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1aWRsZS5o
ICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9w
cm9jZXNzLmMgICAgICAgfCAgMyArKy0KPiA+ICAgNSBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jcHVpZGxlLmgKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9L
Y29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCBmZTY4NjJiMDZlYWQuLjQ5MDEy
MDBiNmI2YyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gKysrIGIvYXJj
aC9yaXNjdi9LY29uZmlnCj4gPiBAQCAtMzcsNiArMzcsNyBAQCBjb25maWcgUklTQ1YKPiA+ICAg
ICAgIHNlbGVjdCBDTE9ORV9CQUNLV0FSRFMKPiA+ICAgICAgIHNlbGVjdCBDTElOVF9USU1FUiBp
ZiAhTU1VCj4gPiAgICAgICBzZWxlY3QgQ09NTU9OX0NMSwo+ID4gKyAgICAgc2VsZWN0IENQVV9Q
TSBpZiBDUFVfSURMRQo+ID4gICAgICAgc2VsZWN0IEVEQUNfU1VQUE9SVAo+ID4gICAgICAgc2Vs
ZWN0IEdFTkVSSUNfQVJDSF9UT1BPTE9HWSBpZiBTTVAKPiA+ICAgICAgIHNlbGVjdCBHRU5FUklD
X0FUT01JQzY0IGlmICE2NEJJVAo+ID4gQEAgLTQzMCw0ICs0MzEsMTAgQEAgc291cmNlICJrZXJu
ZWwvcG93ZXIvS2NvbmZpZyIKPiA+Cj4gPiAgIGVuZG1lbnUKPiA+Cj4gPiArbWVudSAiQ1BVIFBv
d2VyIE1hbmFnZW1lbnQiCj4gPiArCj4gPiArc291cmNlICJkcml2ZXJzL2NwdWlkbGUvS2NvbmZp
ZyIKPiA+ICsKPiA+ICtlbmRtZW51Cj4gPiArCj4gPiAgIHNvdXJjZSAiZHJpdmVycy9maXJtd2Fy
ZS9LY29uZmlnIgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcg
Yi9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnCj4gPiBpbmRleCA2YzA2MjVhYTk2YzcuLmRj
NDkyN2MwZTQ0YiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPiA+IEBAIC0xMywxMSArMTMs
MTMgQEAgQ09ORklHX1VTRVJfTlM9eQo+ID4gICBDT05GSUdfQ0hFQ0tQT0lOVF9SRVNUT1JFPXkK
PiA+ICAgQ09ORklHX0JMS19ERVZfSU5JVFJEPXkKPiA+ICAgQ09ORklHX0VYUEVSVD15Cj4gPiAr
IyBDT05GSUdfU1lTRlNfU1lTQ0FMTCBpcyBub3Qgc2V0Cj4gPiAgIENPTkZJR19CUEZfU1lTQ0FM
TD15Cj4gPiAgIENPTkZJR19TT0NfU0lGSVZFPXkKPiA+ICAgQ09ORklHX1NPQ19WSVJUPXkKPiA+
ICAgQ09ORklHX1NNUD15Cj4gPiAgIENPTkZJR19IT1RQTFVHX0NQVT15Cj4gPiArQ09ORklHX0NQ
VV9JRExFPXkKPiA+ICAgQ09ORklHX0pVTVBfTEFCRUw9eQo+ID4gICBDT05GSUdfTU9EVUxFUz15
Cj4gPiAgIENPTkZJR19NT0RVTEVfVU5MT0FEPXkKPiA+IEBAIC02NSwxMCArNjcsOSBAQCBDT05G
SUdfSFdfUkFORE9NPXkKPiA+ICAgQ09ORklHX0hXX1JBTkRPTV9WSVJUSU89eQo+ID4gICBDT05G
SUdfU1BJPXkKPiA+ICAgQ09ORklHX1NQSV9TSUZJVkU9eQo+ID4gKyMgQ09ORklHX1BUUF8xNTg4
X0NMT0NLIGlzIG5vdCBzZXQKPiA+ICAgQ09ORklHX0dQSU9MSUI9eQo+ID4gICBDT05GSUdfR1BJ
T19TSUZJVkU9eQo+ID4gLSMgQ09ORklHX1BUUF8xNTg4X0NMT0NLIGlzIG5vdCBzZXQKPiA+IC1D
T05GSUdfUE9XRVJfUkVTRVQ9eQo+Cj4gV2h5IGRvIHlvdSByZW1vdmUgdGhpcyBjb25maWcgPwoK
QXJnaCwgSSBkb24ndCBrbm93IGhvdyB0aGlzIGdvdCBoZXJlLiBJIHdpbGwgcmVtb3ZlCnRoaXMg
Y2hhbmdlIGluIHRoZSBuZXh0IHJldmlzaW9uLiBUaGFua3MgZm9yIGNhdGNoaW5nLgoKPgo+ID4g
ICBDT05GSUdfRFJNPXkKPiA+ICAgQ09ORklHX0RSTV9SQURFT049eQo+ID4gICBDT05GSUdfRFJN
X1ZJUlRJT19HUFU9eQo+ID4gQEAgLTEzMiw1ICsxMzMsMyBAQCBDT05GSUdfREVCVUdfQkxPQ0tf
RVhUX0RFVlQ9eQo+ID4gICAjIENPTkZJR19GVFJBQ0UgaXMgbm90IHNldAo+ID4gICAjIENPTkZJ
R19SVU5USU1FX1RFU1RJTkdfTUVOVSBpcyBub3Qgc2V0Cj4gPiAgIENPTkZJR19NRU1URVNUPXkK
PiA+IC0jIENPTkZJR19TWVNGU19TWVNDQUxMIGlzIG5vdCBzZXQKPiA+IC1DT05GSUdfRUZJPXkK
Pgo+IEFuZCB0aGlzIGlzIG9uZSB0b28gPyBJZiB0aG9zZSByZW1vdmFscyBhcmUgaW50ZW50aW9u
YWwsIG1heWJlIHlvdSBjYW4KPiBhZGQgc29tZXRoaW5nIGFib3V0IHRoYXQgaW4gdGhlIGNvbW1p
dCBkZXNjcmlwdGlvbiA/CgpJIHdpbGwgcmVtb3ZlIHRoaXMgY2hhbmdlIGFzIHdlbGwuCgo+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25maWdzL3J2MzJfZGVmY29uZmlnIGIvYXJjaC9y
aXNjdi9jb25maWdzL3J2MzJfZGVmY29uZmlnCj4gPiBpbmRleCA4ZGQwMmI4NDJmZWYuLjMzMmU0
M2E0YTJjMyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvY29uZmlncy9ydjMyX2RlZmNvbmZp
Zwo+ID4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL3J2MzJfZGVmY29uZmlnCj4gPiBAQCAtMTMs
MTIgKzEzLDE0IEBAIENPTkZJR19VU0VSX05TPXkKPiA+ICAgQ09ORklHX0NIRUNLUE9JTlRfUkVT
VE9SRT15Cj4gPiAgIENPTkZJR19CTEtfREVWX0lOSVRSRD15Cj4gPiAgIENPTkZJR19FWFBFUlQ9
eQo+ID4gKyMgQ09ORklHX1NZU0ZTX1NZU0NBTEwgaXMgbm90IHNldAo+ID4gICBDT05GSUdfQlBG
X1NZU0NBTEw9eQo+ID4gICBDT05GSUdfU09DX1NJRklWRT15Cj4gPiAgIENPTkZJR19TT0NfVklS
VD15Cj4gPiAgIENPTkZJR19BUkNIX1JWMzJJPXkKPiA+ICAgQ09ORklHX1NNUD15Cj4gPiAgIENP
TkZJR19IT1RQTFVHX0NQVT15Cj4gPiArQ09ORklHX0NQVV9JRExFPXkKPiA+ICAgQ09ORklHX0pV
TVBfTEFCRUw9eQo+ID4gICBDT05GSUdfTU9EVUxFUz15Cj4gPiAgIENPTkZJR19NT0RVTEVfVU5M
T0FEPXkKPiA+IEBAIC02Nyw3ICs2OSw2IEBAIENPTkZJR19IV19SQU5ET01fVklSVElPPXkKPiA+
ICAgQ09ORklHX1NQST15Cj4gPiAgIENPTkZJR19TUElfU0lGSVZFPXkKPiA+ICAgIyBDT05GSUdf
UFRQXzE1ODhfQ0xPQ0sgaXMgbm90IHNldAo+ID4gLUNPTkZJR19QT1dFUl9SRVNFVD15Cj4gPiAg
IENPTkZJR19EUk09eQo+ID4gICBDT05GSUdfRFJNX1JBREVPTj15Cj4gPiAgIENPTkZJR19EUk1f
VklSVElPX0dQVT15Cj4gPiBAQCAtMTMxLDQgKzEzMiwzIEBAIENPTkZJR19ERUJVR19CTE9DS19F
WFRfREVWVD15Cj4gPiAgICMgQ09ORklHX0ZUUkFDRSBpcyBub3Qgc2V0Cj4gPiAgICMgQ09ORklH
X1JVTlRJTUVfVEVTVElOR19NRU5VIGlzIG5vdCBzZXQKPiA+ICAgQ09ORklHX01FTVRFU1Q9eQo+
ID4gLSMgQ09ORklHX1NZU0ZTX1NZU0NBTEwgaXMgbm90IHNldAo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1aWRsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
cHVpZGxlLmgKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjEwNDJkNzkwZTQ0Ngo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jcHVpZGxlLmgKPiA+IEBAIC0wLDAgKzEsMjQgQEAKPiA+ICsvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAy
MDIxIEFsbHdpbm5lciBMdGQKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgV2VzdGVybiBEaWdp
dGFsIENvcnBvcmF0aW9uIG9yIGl0cyBhZmZpbGlhdGVzLgo+ID4gKyAqLwo+ID4gKwo+ID4gKyNp
Zm5kZWYgX0FTTV9SSVNDVl9DUFVJRExFX0gKPiA+ICsjZGVmaW5lIF9BU01fUklTQ1ZfQ1BVSURM
RV9ICj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4gPiArI2luY2x1ZGUgPGFz
bS9wcm9jZXNzb3IuaD4KPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgY3B1X2RvX2lkbGUo
dm9pZCkKPiA+ICt7Cj4gPiArICAgICAvKgo+ID4gKyAgICAgICogQWRkIG1iKCkgaGVyZSB0byBl
bnN1cmUgdGhhdCBhbGwKPiA+ICsgICAgICAqIElPL01FTSBhY2Nlc3MgYXJlIGNvbXBsZXRlZCBw
cmlvcgo+Cj4gYWNjZXNzRVMgPwoKT2theSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICsgICAgICAqIHRv
IGVudGVyIFdGSS4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgbWIoKTsKPiA+ICsgICAgIHdhaXRf
Zm9yX2ludGVycnVwdCgpOwo+ID4gK30KPiA+ICsKPiA+ICsjZW5kaWYKPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNz
LmMKPiA+IGluZGV4IGRkNWY5ODViMWY0MC4uYjViNTFmZDI2NjI0IDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9jZXNzLmMKPiA+IEBAIC0yMSw2ICsyMSw3IEBACj4gPiAgICNpbmNsdWRlIDxhc20vc3RyaW5n
Lmg+Cj4gPiAgICNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4gPiAgICNpbmNsdWRlIDxhc20v
dGhyZWFkX2luZm8uaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2NwdWlkbGUuaD4KPiA+Cj4gPiAgIHJl
Z2lzdGVyIHVuc2lnbmVkIGxvbmcgZ3BfaW5fZ2xvYmFsIF9fYXNtX18oImdwIik7Cj4gPgo+ID4g
QEAgLTM1LDcgKzM2LDcgQEAgZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9rZXJuZWxf
dGhyZWFkKHZvaWQpOwo+ID4KPiA+ICAgdm9pZCBhcmNoX2NwdV9pZGxlKHZvaWQpCj4gPiAgIHsK
PiA+IC0gICAgIHdhaXRfZm9yX2ludGVycnVwdCgpOwo+ID4gKyAgICAgY3B1X2RvX2lkbGUoKTsK
PiA+ICAgICAgIHJhd19sb2NhbF9pcnFfZW5hYmxlKCk7Cj4gPiAgIH0KPiA+Cj4gPgoKUmVnYXJk
cywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

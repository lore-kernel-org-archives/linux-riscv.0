Return-Path: <SRS0=b61k=IA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17096C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 06:42:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7277360201
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 06:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7277360201
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dBnyoCyptaTnYT47/eqYJ+T5jJDB1H5Hda5T54BxH4k=; b=gvHmRUSKMkIPlGE54qA1mZ+Fy
	J6/wrYogWo+HgLV0llZixQ/YcHzsu8jDDFvzfpDXvCewc+94YKMsLVnDrFSCHULSNeel7DIvr217+
	tA/QWCOLDThhpwWY/3TLyViQo9ixbidXmt8EsCOhuyBdghIcDWsdrO+kfHOn0ijhNHYqkmE+F5gtP
	V/yi8xBnWLkMWkU9f3eOXpCFUHXkTM//OXWyktpHf3AvdnGvP66ac9mtRimbrGMr5ipJR8pqtDNU+
	+BrFZTZNg2EvVsH1MJNQuAPJOnyksR1KIEAr5qA8Z8w2E1G5wpjY0oEEQ3l7969rcL7FjefL1R6QN
	A0qn2Ia+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGyjz-0001jN-Sw; Tue, 02 Mar 2021 06:42:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGyjv-0001hy-1w
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 06:42:40 +0000
Received: by mail-wr1-x42c.google.com with SMTP id b18so12142484wrn.6
 for <linux-riscv@lists.infradead.org>; Mon, 01 Mar 2021 22:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tfd97WX1co/bA1GShyJOLBPAN41kKS3JMrc0KxlzgGU=;
 b=X3HySQSox1FrvVZIqGKp3GG6HIrkQQVlWJxpD5Cco4Ge2nF0iwz+VlZzafhh+7M7kK
 Ec3QuQX8AccyoXeXbACGA6WDmbvBYjKDKKH+UpLB01eR6ha3wPafBmLjBhmpY6qJiOqw
 bK2kyAE5fEuIRwu+B6ITr7rrY30tatyMOpGz+8exxEsQP2enrIsMEIN27dRfsMvLplZx
 nlH+uXvkTP0FbPoFiBFwLFeJVzY0lU+WxTi+Y3lnpg+eG+caUSBga2HP1cv0ixswGjec
 VRhGC6ZRxaBRCEeJrksMHekp+Xah/I+GfxaeShSi7hK5InuZn7lg7zDRWsnbVXyGYh6R
 IsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tfd97WX1co/bA1GShyJOLBPAN41kKS3JMrc0KxlzgGU=;
 b=ZRghCBqmgs6akmWTkAsgwwWnGeeHISBlw/uxNkmVis4bLhdiDUKCFCgbDQSuVs+/yn
 RmpwRjGtsRwyd10PfqVFvvqK/TRN7hOivwmXWpzP8Xw/XtgAsu0oDwkDkgWa6CJlzi7u
 pcru3eNozGcNyHnASWjFBCtSiwaFIKXpo/jKpnQqUm1rFKasWR4l9HQ0f2fEp5xbz5PP
 FVTu0KSsblgVsJ4WFN4jBRzOI8lfdS15vQ8UplAACH+Ec/ExOglxLcNJkXBC6kFYe6qS
 dWiPVAk2MkOJrWzICewop1CmOUwx0xBXr/9B5qFkcSYV99zcPqcwBdLf8c0pXXYObw0C
 R6Cw==
X-Gm-Message-State: AOAM533ObkDRfmqLaKl88/Of/ZgE4jbekig3/6UK7JwFP23ieGNpXENP
 fUAvXgt9rhuGhn9mH+9IW7V6IN7ZNkrdR9dFRwvbcA==
X-Google-Smtp-Source: ABdhPJz1mZd5y4d1mGFzB+y5OipFPnyMJbdA+7nb01Qbnev+st2N3Fi1s+PseO+OVJpZp0oP8W2X+LgHDA+7KkohnTo=
X-Received: by 2002:a5d:464f:: with SMTP id j15mr21059836wrs.390.1614667357370; 
 Mon, 01 Mar 2021 22:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20210221093758.210981-1-anup.patel@wdc.com>
 <20210221093758.210981-2-anup.patel@wdc.com>
 <3a6e2af7-934d-078f-4e19-d4241809e7fb@ghiti.fr>
In-Reply-To: <3a6e2af7-934d-078f-4e19-d4241809e7fb@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Mar 2021 12:12:26 +0530
Message-ID: <CAAhSdy2cOoNK5f75e_mo5c-0-qo4zNWH+Lxoyg31br-+ZZ4n9w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] RISC-V: Enable CPU_IDLE drivers
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_014239_288779_D2122B3B 
X-CRM114-Status: GOOD (  28.02  )
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

T24gRnJpLCBGZWIgMjYsIDIwMjEgYXQgNjo0NiBQTSBBbGV4IEdoaXRpIDxhbGV4QGdoaXRpLmZy
PiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBMZSAyLzIxLzIxIMOgIDQ6MzcgQU0sIEFudXAgUGF0
ZWwgYSDDqWNyaXQgOgo+ID4gV2UgZm9yY2Ugc2VsZWN0IENQVV9QTSBhbmQgcHJvdmlkZSBhc20v
Y3B1aWRsZS5oIHNvIHRoYXQgd2UgY2FuCj4gPiB1c2UgQ1BVIElETEUgZHJpdmVycyBmb3IgTGlu
dXggUklTQy1WIGtlcm5lbC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
LnBhdGVsQHdkYy5jb20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAg
ICAgICAgIHwgIDcgKysrKysrKwo+ID4gICBhcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnICAg
ICAgfCAgNyArKystLS0tCj4gPiAgIGFyY2gvcmlzY3YvY29uZmlncy9ydjMyX2RlZmNvbmZpZyB8
ICA0ICsrLS0KPiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVpZGxlLmggIHwgMjQgKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAg
ICAgICB8ICAzICsrLQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2NwdWlkbGUuaAo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IGZlNjg2MmIwNmVhZC4uNDkwMTIwMGI2YjZjIDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tj
b25maWcKPiA+IEBAIC0zNyw2ICszNyw3IEBAIGNvbmZpZyBSSVNDVgo+ID4gICAgICAgc2VsZWN0
IENMT05FX0JBQ0tXQVJEUwo+ID4gICAgICAgc2VsZWN0IENMSU5UX1RJTUVSIGlmICFNTVUKPiA+
ICAgICAgIHNlbGVjdCBDT01NT05fQ0xLCj4gPiArICAgICBzZWxlY3QgQ1BVX1BNIGlmIENQVV9J
RExFCj4gPiAgICAgICBzZWxlY3QgRURBQ19TVVBQT1JUCj4gPiAgICAgICBzZWxlY3QgR0VORVJJ
Q19BUkNIX1RPUE9MT0dZIGlmIFNNUAo+ID4gICAgICAgc2VsZWN0IEdFTkVSSUNfQVRPTUlDNjQg
aWYgITY0QklUCj4gPiBAQCAtNDMwLDQgKzQzMSwxMCBAQCBzb3VyY2UgImtlcm5lbC9wb3dlci9L
Y29uZmlnIgo+ID4KPiA+ICAgZW5kbWVudQo+ID4KPiA+ICttZW51ICJDUFUgUG93ZXIgTWFuYWdl
bWVudCIKPiA+ICsKPiA+ICtzb3VyY2UgImRyaXZlcnMvY3B1aWRsZS9LY29uZmlnIgo+ID4gKwo+
ID4gK2VuZG1lbnUKPiA+ICsKPiA+ICAgc291cmNlICJkcml2ZXJzL2Zpcm13YXJlL0tjb25maWci
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvcmlz
Y3YvY29uZmlncy9kZWZjb25maWcKPiA+IGluZGV4IDZjMDYyNWFhOTZjNy4uZGM0OTI3YzBlNDRi
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+ID4gKysrIGIv
YXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+ID4gQEAgLTEzLDExICsxMywxMyBAQCBDT05G
SUdfVVNFUl9OUz15Cj4gPiAgIENPTkZJR19DSEVDS1BPSU5UX1JFU1RPUkU9eQo+ID4gICBDT05G
SUdfQkxLX0RFVl9JTklUUkQ9eQo+ID4gICBDT05GSUdfRVhQRVJUPXkKPiA+ICsjIENPTkZJR19T
WVNGU19TWVNDQUxMIGlzIG5vdCBzZXQKPiA+ICAgQ09ORklHX0JQRl9TWVNDQUxMPXkKPiA+ICAg
Q09ORklHX1NPQ19TSUZJVkU9eQo+ID4gICBDT05GSUdfU09DX1ZJUlQ9eQo+ID4gICBDT05GSUdf
U01QPXkKPiA+ICAgQ09ORklHX0hPVFBMVUdfQ1BVPXkKPiA+ICtDT05GSUdfQ1BVX0lETEU9eQo+
ID4gICBDT05GSUdfSlVNUF9MQUJFTD15Cj4gPiAgIENPTkZJR19NT0RVTEVTPXkKPiA+ICAgQ09O
RklHX01PRFVMRV9VTkxPQUQ9eQo+ID4gQEAgLTY1LDEwICs2Nyw5IEBAIENPTkZJR19IV19SQU5E
T009eQo+ID4gICBDT05GSUdfSFdfUkFORE9NX1ZJUlRJTz15Cj4gPiAgIENPTkZJR19TUEk9eQo+
ID4gICBDT05GSUdfU1BJX1NJRklWRT15Cj4gPiArIyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0sgaXMg
bm90IHNldAo+ID4gICBDT05GSUdfR1BJT0xJQj15Cj4gPiAgIENPTkZJR19HUElPX1NJRklWRT15
Cj4gPiAtIyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0sgaXMgbm90IHNldAo+ID4gLUNPTkZJR19QT1dF
Ul9SRVNFVD15Cj4KPiBXaHkgZG8geW91IHJlbW92ZSB0aGlzIGNvbmZpZyA/CgpUaGlzIG9wdGlv
biBpcyBzZWxlY3RlZCBieSBDT05GSUdfU09DX1ZJUlQgc28gaXQgaXMgYmVpbmcKcmVtb3ZlZCBm
cm9tIGRlZmNvbmZpZyBieSBzYXZlZGVmY29uZmlnLgoKPgo+ID4gICBDT05GSUdfRFJNPXkKPiA+
ICAgQ09ORklHX0RSTV9SQURFT049eQo+ID4gICBDT05GSUdfRFJNX1ZJUlRJT19HUFU9eQo+ID4g
QEAgLTEzMiw1ICsxMzMsMyBAQCBDT05GSUdfREVCVUdfQkxPQ0tfRVhUX0RFVlQ9eQo+ID4gICAj
IENPTkZJR19GVFJBQ0UgaXMgbm90IHNldAo+ID4gICAjIENPTkZJR19SVU5USU1FX1RFU1RJTkdf
TUVOVSBpcyBub3Qgc2V0Cj4gPiAgIENPTkZJR19NRU1URVNUPXkKPiA+IC0jIENPTkZJR19TWVNG
U19TWVNDQUxMIGlzIG5vdCBzZXQKPiA+IC1DT05GSUdfRUZJPXkKPgo+IEFuZCB0aGlzIGlzIG9u
ZSB0b28gPyBJZiB0aG9zZSByZW1vdmFscyBhcmUgaW50ZW50aW9uYWwsIG1heWJlIHlvdSBjYW4K
PiBhZGQgc29tZXRoaW5nIGFib3V0IHRoYXQgaW4gdGhlIGNvbW1pdCBkZXNjcmlwdGlvbiA/CgpU
aGlzIGlzIGVuYWJsZWQgYnkgZGVmYXVsdCBzbyBzYXZlZGVmY29uZmlnIHJlbW92ZXMgaXQuCgo+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25maWdzL3J2MzJfZGVmY29uZmlnIGIvYXJj
aC9yaXNjdi9jb25maWdzL3J2MzJfZGVmY29uZmlnCj4gPiBpbmRleCA4ZGQwMmI4NDJmZWYuLjMz
MmU0M2E0YTJjMyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvY29uZmlncy9ydjMyX2RlZmNv
bmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL3J2MzJfZGVmY29uZmlnCj4gPiBAQCAt
MTMsMTIgKzEzLDE0IEBAIENPTkZJR19VU0VSX05TPXkKPiA+ICAgQ09ORklHX0NIRUNLUE9JTlRf
UkVTVE9SRT15Cj4gPiAgIENPTkZJR19CTEtfREVWX0lOSVRSRD15Cj4gPiAgIENPTkZJR19FWFBF
UlQ9eQo+ID4gKyMgQ09ORklHX1NZU0ZTX1NZU0NBTEwgaXMgbm90IHNldAo+ID4gICBDT05GSUdf
QlBGX1NZU0NBTEw9eQo+ID4gICBDT05GSUdfU09DX1NJRklWRT15Cj4gPiAgIENPTkZJR19TT0Nf
VklSVD15Cj4gPiAgIENPTkZJR19BUkNIX1JWMzJJPXkKPiA+ICAgQ09ORklHX1NNUD15Cj4gPiAg
IENPTkZJR19IT1RQTFVHX0NQVT15Cj4gPiArQ09ORklHX0NQVV9JRExFPXkKPiA+ICAgQ09ORklH
X0pVTVBfTEFCRUw9eQo+ID4gICBDT05GSUdfTU9EVUxFUz15Cj4gPiAgIENPTkZJR19NT0RVTEVf
VU5MT0FEPXkKPiA+IEBAIC02Nyw3ICs2OSw2IEBAIENPTkZJR19IV19SQU5ET01fVklSVElPPXkK
PiA+ICAgQ09ORklHX1NQST15Cj4gPiAgIENPTkZJR19TUElfU0lGSVZFPXkKPiA+ICAgIyBDT05G
SUdfUFRQXzE1ODhfQ0xPQ0sgaXMgbm90IHNldAo+ID4gLUNPTkZJR19QT1dFUl9SRVNFVD15Cj4g
PiAgIENPTkZJR19EUk09eQo+ID4gICBDT05GSUdfRFJNX1JBREVPTj15Cj4gPiAgIENPTkZJR19E
Uk1fVklSVElPX0dQVT15Cj4gPiBAQCAtMTMxLDQgKzEzMiwzIEBAIENPTkZJR19ERUJVR19CTE9D
S19FWFRfREVWVD15Cj4gPiAgICMgQ09ORklHX0ZUUkFDRSBpcyBub3Qgc2V0Cj4gPiAgICMgQ09O
RklHX1JVTlRJTUVfVEVTVElOR19NRU5VIGlzIG5vdCBzZXQKPiA+ICAgQ09ORklHX01FTVRFU1Q9
eQo+ID4gLSMgQ09ORklHX1NZU0ZTX1NZU0NBTEwgaXMgbm90IHNldAo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1aWRsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jcHVpZGxlLmgKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjEwNDJkNzkwZTQ0Ngo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jcHVpZGxlLmgKPiA+IEBAIC0wLDAgKzEsMjQgQEAKPiA+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChD
KSAyMDIxIEFsbHdpbm5lciBMdGQKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgV2VzdGVybiBE
aWdpdGFsIENvcnBvcmF0aW9uIG9yIGl0cyBhZmZpbGlhdGVzLgo+ID4gKyAqLwo+ID4gKwo+ID4g
KyNpZm5kZWYgX0FTTV9SSVNDVl9DUFVJRExFX0gKPiA+ICsjZGVmaW5lIF9BU01fUklTQ1ZfQ1BV
SURMRV9ICj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4gPiArI2luY2x1ZGUg
PGFzbS9wcm9jZXNzb3IuaD4KPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgY3B1X2RvX2lk
bGUodm9pZCkKPiA+ICt7Cj4gPiArICAgICAvKgo+ID4gKyAgICAgICogQWRkIG1iKCkgaGVyZSB0
byBlbnN1cmUgdGhhdCBhbGwKPiA+ICsgICAgICAqIElPL01FTSBhY2Nlc3MgYXJlIGNvbXBsZXRl
ZCBwcmlvcgo+Cj4gYWNjZXNzRVMgPwo+Cj4gPiArICAgICAgKiB0byBlbnRlciBXRkkuCj4gPiAr
ICAgICAgKi8KPiA+ICsgICAgIG1iKCk7Cj4gPiArICAgICB3YWl0X2Zvcl9pbnRlcnJ1cHQoKTsK
PiA+ICt9Cj4gPiArCj4gPiArI2VuZGlmCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvY2Vzcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBpbmRleCBkZDVm
OTg1YjFmNDAuLmI1YjUxZmQyNjYyNCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Nlc3MuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBAQCAt
MjEsNiArMjEsNyBAQAo+ID4gICAjaW5jbHVkZSA8YXNtL3N0cmluZy5oPgo+ID4gICAjaW5jbHVk
ZSA8YXNtL3N3aXRjaF90by5oPgo+ID4gICAjaW5jbHVkZSA8YXNtL3RocmVhZF9pbmZvLmg+Cj4g
PiArI2luY2x1ZGUgPGFzbS9jcHVpZGxlLmg+Cj4gPgo+ID4gICByZWdpc3RlciB1bnNpZ25lZCBs
b25nIGdwX2luX2dsb2JhbCBfX2FzbV9fKCJncCIpOwo+ID4KPiA+IEBAIC0zNSw3ICszNiw3IEBA
IGV4dGVybiBhc21saW5rYWdlIHZvaWQgcmV0X2Zyb21fa2VybmVsX3RocmVhZCh2b2lkKTsKPiA+
Cj4gPiAgIHZvaWQgYXJjaF9jcHVfaWRsZSh2b2lkKQo+ID4gICB7Cj4gPiAtICAgICB3YWl0X2Zv
cl9pbnRlcnJ1cHQoKTsKPiA+ICsgICAgIGNwdV9kb19pZGxlKCk7Cj4gPiAgICAgICByYXdfbG9j
YWxfaXJxX2VuYWJsZSgpOwo+ID4gICB9Cj4gPgo+ID4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

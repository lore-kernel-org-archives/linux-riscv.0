Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF6AC54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Lo2pp+3/r3AFkMcK2pKVEQsx7EvmFLeKak2k4M5ybs=; b=OdtDEzMERZoC51
	ygyVAgO6GvHfJC4B/21OSltAZdE6qHQmQCrXkGzOslC8NgzEKCJNEfq1vpaEiNdwA81XAOE0h20C0
	MesKRcrc/k/3bFcu9vBbLb34Po04hRK3j2h5LCZuI5WSXk+NrS9oJKPtKMFPil7355PAbq058fjQL
	AnUisxQ0gun6lZkauQtNRebrWeUA90ohrgcb3gIf4JSUsIRpi03jK2ff9SvjuBiFuDm2hE2JXz8+6
	5s0TUAAMt9zjU/qh0yZTY/H3jF+F2Q5nSgL2X3Jv7ycZG0MyP2npUei4TmFyIkoRBK/TeiDL91FmF
	rQpAT0LokPwUhqzjFfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJv6O-0000000AuXG-2DiJ;
	Tue, 27 May 2025 14:16:24 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJv6L-0000000AuWS-09Hk
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 14:16:22 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-708d90aa8f9so28241477b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 May 2025 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748355379; x=1748960179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmbA+KWJRYN4kKTsiIcnj3lBKzT+suvb8j4FzpdCenQ=;
        b=0umZIvthB2wROWXNmaFmWDE68yQHh9IwonRA1tBKzN1w736HL597KVKmUD0ichUMYk
         6G6gcH5vVGnvoFtHRG7Z7bs49+CnCn5v12SyUbbxT1lnasXv6eORUda6HleIIs8tLvnE
         YHA1Nho9gkatI1APE6fePr5bdnXeGcIf4zD9P4ZPXZWqjrROBsJpUP8968xZTtFEkSuo
         Ar91xIiTp4lvRew2XlB8s+GIMloa+x+lXzyCdb2ZbxHkV0WW6vylvsV60AZhoAlFYDZ0
         M5dErEk69bo1LsjTBCv6a8I3HHbjhWgzlSAROcxGSkdtM+BIohv2K8xZvyz6AsrnBqLu
         04WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355379; x=1748960179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmbA+KWJRYN4kKTsiIcnj3lBKzT+suvb8j4FzpdCenQ=;
        b=a/+6otVsUH5S9sS/e9ZbXvNn07jFyMYqM+Gj6PYjrxo1cdQrq99uqJmy3rjZn3/4tI
         8jsVaMvnjDAOw8PL08PSBBVPvwPEDvOKZssgRJAkNwDJQn/tL5evnPOwAh3c2N/laoYa
         0WmS7Yn1phgqYERNbAPcKfRBBgg9hbnF57372eNjhGIMguPrXa2/4RH+TwVAHtQ89ZxS
         2afl25Gq2a3lquOAb219w4H7FqV0ky8nDZENbM8t5ork49eXLx9x4nx10t0BdA6iaMTe
         GG+bzyhtwlZY+GnlD4UdfyMPUm1jqcxriuD6Pfk0xfWezcm8pJkUuH7oXUCjCfMDLyqw
         DaCw==
X-Gm-Message-State: AOJu0Yysltm3Ac/GAwSwVAReV6fP08YVqQMEPz4PmIJIVucRlt/QC9Mk
	ehOXlaq2lCxAWXKnEulMEonpDKgz64HyKPTmZSrltJQcOnswaoO2XLwiqzcGnMPLPwPkEFRnzlx
	f1IfToMw4ryOMfLWD7bI2SpkvCsncTFeAz6rv3fCmiQ==
X-Gm-Gg: ASbGncuPs2JZ5h7vbbU5GtoDcSral6dH/KK6LdLp7/VUTZHjiVN4irMjSxbTuNUgFoF
	wbpxGNNiJ2Wz3C7wqZJw81r81ymN5Blde6nEunadbPzhj2ItVXQn4B+VSRB8gYTKgk+gjx1r0m6
	MPN+hvCZ6AGG+3vBwpOzJbm+PINs0LBm/L
X-Google-Smtp-Source: AGHT+IFByILDDr/4JzM7q1ErQtXRZlrRWCwnIfBaHYsuSnXyDDL9DfJP8bhytsWrU1Zu6nydSLvBhwu21NeAVkUU/QU=
X-Received: by 2002:a05:690c:9c0e:b0:70b:6651:b3e2 with SMTP id
 00721157ae682-70e2d9488b0mr169827177b3.6.1748355378999; Tue, 27 May 2025
 07:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250522073327.246668-1-wangjingwei@iscas.ac.cn>
In-Reply-To: <20250522073327.246668-1-wangjingwei@iscas.ac.cn>
From: Jesse Taube <jesse@rivosinc.com>
Date: Tue, 27 May 2025 07:16:08 -0700
X-Gm-Features: AX0GCFujEUw4VTFvWx9GiZk7vuvFRGBto3BjHiiDMXBQ8vtytZ3fpT-U5ypmk-Y
Message-ID: <CALSpo=Z=bfp4UxAJAD=8mjSGYUo7wb-=hhYWh62Ar-pQp7mv5A@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: hwprobe: Fix stale vDSO data for
 late-initialized keys at boot
To: Jingwei Wang <wangjingwei@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Yixun Lan <dlan@gentoo.org>, 
	Tsukasa OI <research_trasio@irq.a4lg.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_071621_338683_8285BF07 
X-CRM114-Status: GOOD (  24.42  )
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

T24gVGh1LCBNYXkgMjIsIDIwMjUgYXQgMTI6MzTigK9BTSBKaW5nd2VpIFdhbmcgPHdhbmdqaW5n
d2VpQGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSByaXNjdl9od3Byb2JlIHZEU08gZGF0YSBp
cyBwb3B1bGF0ZWQgYnkgaW5pdF9od3Byb2JlX3Zkc29fZGF0YSgpLAo+IGFuIGFyY2hfaW5pdGNh
bGxfc3luYy4gSG93ZXZlciwgdW5kZXJseWluZyBkYXRhIGZvciBzb21lIGtleXMsIGxpa2UKPiBS
SVNDVl9IV1BST0JFX0tFWV9NSVNBTElHTkVEX1ZFQ1RPUl9QRVJGLCBpcyBkZXRlcm1pbmVkIGFz
eW5jaHJvbm91c2x5Lgo+Cj4gU3BlY2lmaWNhbGx5LCB0aGUgcGVyX2NwdSh2ZWN0b3JfbWlzYWxp
Z25lZF9hY2Nlc3MsIGNwdSkgdmFsdWVzIGFyZSBzZXQKPiBieSB0aGUgdmVjX2NoZWNrX3VuYWxp
Z25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMga3RocmVhZC4gVGhpcyBrdGhyZWFkCj4gaXMgc3Bh
d25lZCBieSBhbiBlYXJsaWVyIGFyY2hfaW5pdGNhbGwgKGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nf
YWxsX2NwdXMpCj4gYW5kIG1heSBjb21wbGV0ZSBpdHMgYmVuY2htYXJrICphZnRlciogaW5pdF9o
d3Byb2JlX3Zkc29fZGF0YSgpIGhhcwo+IGFscmVhZHkgcG9wdWxhdGVkIHRoZSB2RFNPIHdpdGgg
ZGVmYXVsdC9zdGFsZSB2YWx1ZXMuCj4KPiBTbywgcmVmcmVzaCB0aGUgdkRTTyBkYXRhIGZvciBz
cGVjaWZpZWQga2V5cyAoZS5nLiwKPiBNSVNBTElHTkVEX1ZFQ1RPUl9QRVJGKSBlbnN1cmluZyBp
dCByZWZsZWN0cyB0aGUgZmluYWwgYm9vdC10aW1lIHZhbHVlcy4KPgo+IFRlc3QgYnkgY29tcGFy
aW5nIHZEU08gYW5kIHN5c2NhbGwgcmVzdWx0cyBmb3IgYWZmZWN0ZWQga2V5cwo+IChlLmcuLCBN
SVNBTElHTkVEX1ZFQ1RPUl9QRVJGKSwgd2hpY2ggbm93IG1hdGNoIHRoZWlyIGZpbmFsCj4gYm9v
dC10aW1lIHZhbHVlcy4KPgo+IFJlcG9ydGVkLWJ5OiBUc3VrYXNhIE9JIDxyZXNlYXJjaF90cmFz
aW9AaXJxLmE0bGcuY29tPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvNzYwZDYzN2ItYjEzYi00NTE4LWI2YmYtODgzZDU1ZDQ0ZTdmQGlycS5hNGxnLmNvbS8K
PiBGaXhlczogZTdjOWQ2NmUzMTNiICgiUklTQy1WOiBSZXBvcnQgdmVjdG9yIHVuYWxpZ25lZCBh
Y2Nlc3Mgc3BlZWQgaHdwcm9iZSIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWdu
ZWQtb2ZmLWJ5OiBKaW5nd2VpIFdhbmcgPHdhbmdqaW5nd2VpQGlzY2FzLmFjLmNuPgo+IC0tLQo+
IENoYW5nZXMgaW4gdjI6Cj4gICAtIEFkZHJlc3NlZCBmZWVkYmFjayBmcm9tIFlpeHVuJ3MgcmVn
YXJkaW5nICNpZmRlZiBDT05GSUdfTU1VIHVzYWdlLgo+ICAgLSBVcGRhdGVkIGNvbW1pdCBtZXNz
YWdlIHRvIHByb3ZpZGUgYSBoaWdoLWxldmVsIHN1bW1hcnkuCj4gICAtIEFkZGVkIEZpeGVzIHRh
ZyBmb3IgY29tbWl0IGU3YzlkNjZlMzEzYi4KPgo+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi8yMDI1MDUyMTA1Mjc1NC4xODUyMzEtMS13YW5namluZ3dlaUBpc2Nhcy5h
Yy5jbi9ULyN1Cj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggICAgICAgICAg
IHwgIDYgKysrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgICAg
ICB8IDE2ICsrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2Fj
Y2Vzc19zcGVlZC5jIHwgIDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+IGluZGV4IDFmNjkw
ZmVhMGUwM2RlNmEuLjU4ZGM4NDdkODZjN2YyYjAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od3Byb2JlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJv
YmUuaAo+IEBAIC00MCw0ICs0MCwxMCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3ZfaHdwcm9i
ZV9wYWlyX2NtcChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiAgICAgICAgIHJldHVybiBw
YWlyLT52YWx1ZSA9PSBvdGhlcl9wYWlyLT52YWx1ZTsKPiAgfQo+Cj4gKyNpZmRlZiBDT05GSUdf
TU1VCj4gK3ZvaWQgcmlzY3ZfaHdwcm9iZV92ZHNvX3N5bmMoX19zNjQgc3luY19rZXkpOwo+ICsj
ZWxzZQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3ZfaHdwcm9iZV92ZHNvX3N5bmMoX19zNjQg
c3luY19rZXkpIHsgfTsKPiArI2VuZGlmIC8qIENPTkZJR19NTVUgKi8KPiArCj4gICNlbmRpZgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+IGluZGV4IDI0OWFlYzg1OTRhOTJhODAuLjJlM2U2MTJi
N2FjNmZkNTcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiBAQCAtMTcsNiArMTcsNyBA
QAo+ICAjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+ICAjaW5jbHVkZSA8YXNtL3ZlbmRvcl9leHRl
bnNpb25zL3RoZWFkX2h3cHJvYmUuaD4KPiAgI2luY2x1ZGUgPHZkc28vdnN5c2NhbGwuaD4KPiAr
I2luY2x1ZGUgPHZkc28vZGF0YXBhZ2UuaD4KPgo+Cj4gIHN0YXRpYyB2b2lkIGh3cHJvYmVfYXJj
aF9pZChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiBAQCAtNTAwLDYgKzUwMSwyMSBAQCBz
dGF0aWMgaW50IF9faW5pdCBpbml0X2h3cHJvYmVfdmRzb19kYXRhKHZvaWQpCj4KPiAgYXJjaF9p
bml0Y2FsbF9zeW5jKGluaXRfaHdwcm9iZV92ZHNvX2RhdGEpOwo+Cj4gK3ZvaWQgcmlzY3ZfaHdw
cm9iZV92ZHNvX3N5bmMoX19zNjQgc3luY19rZXkpCj4gK3sKPiArICAgICAgIHN0cnVjdCB2ZHNv
X2FyY2hfZGF0YSAqYXZkID0gdmRzb19rX2FyY2hfZGF0YTsKPiArICAgICAgIHN0cnVjdCByaXNj
dl9od3Byb2JlIHBhaXI7Cj4gKwo+ICsgICAgICAgcGFpci5rZXkgPSBzeW5jX2tleTsKPiArICAg
ICAgIGh3cHJvYmVfb25lX3BhaXIoJnBhaXIsIGNwdV9vbmxpbmVfbWFzayk7Cj4gKyAgICAgICAv
Kgo+ICsgICAgICAgICogVXBkYXRlIHZEU08gZGF0YSBmb3IgdGhlIGdpdmVuIGtleS4KPiArICAg
ICAgICAqIEN1cnJlbnRseSBmb3Igbm9uLUlEIGtleSB1cGRhdGVzIChlLmcuIE1JU0FMSUdORURf
VkVDVE9SX1BFUkYpLAo+ICsgICAgICAgICogc28gJ2hvbW9nZW5lb3VzX2NwdXMnIGlzIG5vdCBy
ZS1ldmFsdWF0ZWQgaGVyZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgYXZkLT5hbGxfY3B1X2h3
cHJvYmVfdmFsdWVzW3N5bmNfa2V5XSA9IHBhaXIudmFsdWU7Cj4gK30KPiArCj4gICNlbmRpZiAv
KiBDT05GSUdfTU1VICovCj4KPiAgU1lTQ0FMTF9ERUZJTkU1KHJpc2N2X2h3cHJvYmUsIHN0cnVj
dCByaXNjdl9od3Byb2JlIF9fdXNlciAqLCBwYWlycywKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5h
bGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gaW5kZXggNTg1ZDJkY2YyZGFiMWNjYi4uODFiYzQ5OTcz
NTBhY2M4NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNz
X3NwZWVkLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVk
LmMKPiBAQCAtMzc1LDcgKzM3NSw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3ZlY3Rvcl91bmFsaWdu
ZWRfYWNjZXNzKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBfX2Fsd2F5c191bnVzCj4gIHN0YXRp
YyBpbnQgX19pbml0IHZlY19jaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzKHZv
aWQgKnVudXNlZCBfX2Fsd2F5c191bnVzZWQpCj4gIHsKPiAgICAgICAgIHNjaGVkdWxlX29uX2Vh
Y2hfY3B1KGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzKTsKPiAtCj4gKyAgICAgICByaXNj
dl9od3Byb2JlX3Zkc29fc3luYyhSSVNDVl9IV1BST0JFX0tFWV9NSVNBTElHTkVEX1ZFQ1RPUl9Q
RVJGKTsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gICNlbHNlIC8qIENPTkZJR19SSVNDVl9Q
Uk9CRV9WRUNUT1JfVU5BTElHTkVEX0FDQ0VTUyAqLwo+IC0tCj4gMi40OS4wCj4KClJldmlld2Vk
LWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgoKVGhhbmtzLApKZXNzZSBUYXVi
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

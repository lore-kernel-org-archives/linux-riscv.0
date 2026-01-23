Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D28ED7237B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 12:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2c5sSD2OJ3KdQP+8x/fFZQ/qI8jHADyn0CCuIdl7PqQ=; b=cW9wPTBKl7ePpN
	WWBYvwTwRp6MXBEOJVQYjwm0VdfESiFRS/uTJ0VVohUqBVwoR1JsL5BE0ermqBsUDp8j0FgNJ5r6j
	4dhOKP2g2CH8jAYxqZ1z3pQUjVM+DNAEtbvqJsE1IoR+5HjVhbA2ufLsK5dmndSJKvi52UyJFaERD
	HY5qdugpznRrLgJbO/Sdfv3SqNyOsVvkzDY0uV+L9ZjNBJjsqSJBsA8y3lw4UhPgyv0I+BhKoPGXM
	9iO4mS1PT1Fi7ENo22TCTptrGFFmSTDEzLutoOnHnN+r5vAPb53Jx4F8UT4j2DWKTYCQH8TTuml/m
	PK2/pSzxBm+cqKStUmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGHs-00000008uqH-1nyz;
	Fri, 23 Jan 2026 12:29:16 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGHq-00000008upv-1CJS
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 12:29:15 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-408778a8ec4so1456349fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 04:29:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769171353; cv=none;
        d=google.com; s=arc-20240605;
        b=BPmaIg08eHyugKBW9aIdv5SMKuF/O584rNtiUcE2eIAPNdgRbg86b8iFMztdTSpuFF
         reg/KYS4giDEMvneZyW1IVNUa4s3aNs/un5fU1U182p21IPE3p9A0eJcrwAlVDXVt2T1
         8HukhPcNNWyUd88WPY6ESEZrV1r/niTRgCwekymoyMCe3fdAPHDj8/OzefFpIIPqEcRP
         IGnygJzgLVcyYr1CWVf34L1HwsSH/VXnhUL5meXUwddXrLuVG0oO67GynWlVPVjoETBd
         vw9taqQUNoVr41D0lx+uLw5q+lSWf8o2kHSAwhAQe9UeqJDZg4iMwfgteATR9btRwEYR
         4cxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ia/0onmW7rqxIqY0Xa3NnOog6ovCu83wYubolEXe60=;
        fh=SL1M5kKmhtm3NlEVwKnTGrSISZ372WzQQ2j/QIMCilE=;
        b=OeZ+WfDCLjjBmtNBs/KUK2VZoXd3iyMfyhfLLADe5Mve1ifIkCcAhXIERQYuCMihpc
         CfUQ1s9ogSAbP+mmZTp+w0A3MFxIkopd7Zihbdt6ddX74ME9yHFWVnxGUHggqpp/6RIr
         1oHEXYuIqwH3NwKNikSRBsjJAGFFTAusGDm4FVA1icQcCLLSB9Zo3PPXfD1Ac5GQJ0GE
         wjhFc8jEXN5X9vF8a0tJoxfoCnVYaKtcT8UwBl1585/LHc40OpeUkG/2JvEa/rXHYOs+
         yp4XtK3MbdaERVV83iyMqAzdLOuW0imCUPwbdpix/yCa32LPZatPY/Iy3P1LtipKL0rP
         5f9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1769171353; x=1769776153; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ia/0onmW7rqxIqY0Xa3NnOog6ovCu83wYubolEXe60=;
        b=SsYBnv0xxerkXiM/VQBjvNYUNfGT4yftz0ydjyRYQId7NjvzQi9b3JAgxAaOj3+UFc
         rQ0x+3OndPF9zPsR6kBU3nfO2ZBlP5OudSlDZhii9xMshAu6vpAAHB4HhEM2suEf8xKo
         q9+V+ODsvHYsuTpslE+ouhy4yJ1iXXAkQrW9BmVbbCsB0HxTM5i9l7/13ekP4WrZmFNM
         K6ob+ESfcrkimSxLRKTTzQdYhILt10lWQTgx5truH0g2Ppi5QKnWAVYINXB/82TAv3wP
         Z+LBvaWe37uWtFDfuejO6PVykykRvSM2Z1DWJqelSFCD/HKQe0VQdzCVA+7LmBkNy8/u
         bOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769171353; x=1769776153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ia/0onmW7rqxIqY0Xa3NnOog6ovCu83wYubolEXe60=;
        b=FIWxk9wGQIjrecVP7SO/z6leq3hUGLTeEl4SJAm2DzgQ+HK9mLFuN4HDOsz/jMEtsh
         cTNKqzy3O8GeX0ySCxJ/pwaI42dlJ7u8hKrXL0sAFl1DgxpxaHgTzLNkLaHYjHUNenjs
         foVO1YPTmQXerAHI2P/RqfEtj3QymvgkCc5RDVgB68c2d79tTDqFgONcEzIFJwlCPX+b
         rvzdBT/sl0Hmyg2oIa9fL7vVkCoLBqDItH1WspYbg3olrnaHTTmXOznyLaYmKCZT10oc
         Mr6ZxF9nFReqYSRpqRavKn4faU8SHmI+7vMJDSRydMQijbzpGvcNJ65mQkUel8preSmQ
         kG9A==
X-Forwarded-Encrypted: i=1; AJvYcCU6hEVxZLR28UHgR+iHduRGPJukV5e9gkrCyTckRyFkkny/RuJNI3x2MPAuSl+CSWdzPx/Ks9GLTZPYXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw9cXfN66QJ/qsIfUX1oHipxeVqq/t6OXKGstt5OG3RuYpK0DE
	h8dj/3xGWP3i31TiAeqipTJE9SpnQ/J/fepZrxZ4B79GiV3XSnTFq52KOzz78wXKn3xhmyjiY3E
	TF9pyhDxrErdsU62Zy+Py9E5/u61rvWt4xfR5gvO0Ng==
X-Gm-Gg: AZuq6aJKB88a6BqOmtMgc4hUfTIB74MvjN1KMz21fPx2//l2db4tlR4TOHaXeoWPKvv
	vE/CKIrryzMOb75wEodXs123Mna4vww+oBaRFSRgqgXTgNugQEUmxuJMkGbkyRqiCmmgjyAfnFE
	eRS4bK+hKgOf4i7Ur8xtROmCtPsp+wr/e377kbG2xrzJfrhJo1PZIdBLTuBAXZjXu/0/pUJiVTd
	/Bybosja17v05y+pqMHaVK82QZdeusxT90VNSdblgGssE7J5+0EfO8PodQ3exJygxQKa0jtDsVG
	AbFXaufPDNZH7Tv/REwAJis9EhXfrQ==
X-Received: by 2002:a05:6820:150e:b0:661:2215:4feb with SMTP id
 006d021491bc7-662cab7f464mr1186476eaf.62.1769171352774; Fri, 23 Jan 2026
 04:29:12 -0800 (PST)
MIME-Version: 1.0
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <CABvJ_xiUK9BqUJS9-Sk1sS4vhVhyXN8P8NooZ0t_Zp7ycG0bAw@mail.gmail.com>
 <20260122153134.GO1134360@nvidia.com> <CABvJ_xgSbK3omxT7XGJ0N7oEva6dQAJwZxRhsBqi44BRNZ3G5Q@mail.gmail.com>
In-Reply-To: <CABvJ_xgSbK3omxT7XGJ0N7oEva6dQAJwZxRhsBqi44BRNZ3G5Q@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 23 Jan 2026 20:29:01 +0800
X-Gm-Features: AZwV_QjuLN0FLG3VneZxDaqO5dnkTcs75k0VirNO833q66YQcdrVcIgmsYXTtfY
Message-ID: <CABvJ_xhY_4ADOsVVbjhkBm8U1mKVOSwzKMfBw5mUsJe=kkUiLg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page table
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>, lihangjing@bytedance.com, 
	Xu Lu <luxu.kernel@bytedance.com>, patches@lists.linux.dev, 
	xieyongji@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_042914_342835_8EA2D859 
X-CRM114-Status: GOOD (  20.78  )
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

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMTE6MDXigK9BTSBWaW5jZW50IENoZW4gPHZpbmNlbnQu
Y2hlbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSmFuIDIyLCAyMDI2IGF0IDExOjMx
4oCvUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
VGh1LCBKYW4gMjIsIDIwMjYgYXQgMDk6NDY6NDdBTSArMDgwMCwgVmluY2VudCBDaGVuIHdyb3Rl
Ogo+ID4gPiBIaSBKYXNvbiwKPiA+ID4KPiA+ID4gSSB0ZXN0ZWQgdGhpcyBwYXRjaCBzZXQgb24g
bXkgc2lkZSB3aXRoIHRoZSBRRU1VLXZpcnQgbWFjaGluZS4KPiA+ID4gSSB1c2VkIHRoZSBmb2xs
b3dpbmcgUUVNVSBjb21tYW5kIGZvciB0ZXN0aW5nOgo+ID4gPgo+ID4gPiAgICRRRU1VL3FlbXUt
c3lzdGVtLXJpc2N2NjQgXAo+ID4gPiAgICAgLU0gdmlydCxhaWE9YXBsaWMtaW1zaWMsYWlhLWd1
ZXN0cz03LGlvbW11LXN5cz1vbiAtbSA4RyAtbm9ncmFwaGljIFwKPiA+ID4gICAgIC1iaW9zICRP
UEVOU0JJX0lNQUdFIFwKPiA+ID4gICAgIC1zZXJpYWwgbW9uOnN0ZGlvIC1zZXJpYWwgbnVsbCAt
bm9ncmFwaGljIFwKPiA+ID4gICAgIC1kZXZpY2UgZTEwMDBlLG5ldGRldj1uZXQwIFwKPiA+ID4g
ICAgIC1uZXRkZXYgdXNlcixpZD1uZXQwIFwKPiA+ID4gICAgIC1jcHUgcnY2NCx2PXRydWUsdmxl
bj0yNTYsc3NkYmx0cnA9dHJ1ZSxzbWRibHRycD10cnVlIFwKPiA+ID4gICAgIC1kZXZpY2UgJ3si
ZHJpdmVyIjoidmlydGlvLTlwLWRldmljZSIsImZzZGV2Ijoic2hhcmUiLCJtb3VudF90YWciOiJo
b3N0MCJ9Jwo+ID4gPiBcCj4gPiA+ICAgICAtZnNkZXYgbG9jYWwsaWQ9c2hhcmUscGF0aD1zaGFy
ZSxzZWN1cml0eV9tb2RlbD1tYXBwZWQgXAo+ID4gPiAgICAgLWFwcGVuZCAnY29uc29sZT10dHlT
MCBlYXJseWNvbicgXAo+ID4gPiAgICAgLWtlcm5lbCAkS0VSTkVMX0lNQUdFIFwKPiA+ID4gICAg
IC1nZGIgdGNwOjo2MjM0IFwKPiA+ID4gICAgIC1zbXAgNAo+ID4gPgo+ID4gPiBUaGUgYm9vdCBs
b2cgc2hvd3MgdGhhdCB0aGUgZTEwMDBlIGlzIHN1Y2Nlc3NmdWxseSBhZGRlZCB0byBJT01NVSBn
cm91cCAxOgo+ID4gPgo+ID4gPiAgIFsgICAgMC43NTI4MDhdIHBjaSAwMDAwOjAwOjAwLjA6IEFk
ZGluZyB0byBpb21tdSBncm91cCAwCj4gPiA+ICAgWyAgICAwLjc1MzI3OV0gcGNpIDAwMDA6MDA6
MDEuMDogQWRkaW5nIHRvIGlvbW11IGdyb3VwIDEKPiA+ID4gICBbLi4uXQo+ID4gPiAgIFsgICAg
MC43NjMyMTJdIGUxMDAwZSAwMDAwOjAwOjAxLjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAw
MDAyKQo+ID4gPiAgIFsgICAgMC43NjUyNDFdIGUxMDAwZSAwMDAwOjAwOjAxLjA6IEludGVycnVw
dCBUaHJvdHRsaW5nIFJhdGUKPiA+ID4gKGludHMvc2VjKSBzZXQgdG8gZHluYW1pYyBjb25zZXJ2
YXRpdmUgbW9kZQo+ID4gPiAgIFsgICAgMC44NjgxMjBdIGUxMDAwZSAwMDAwOjAwOjAxLjAgZXRo
MDogKFBDSSBFeHByZXNzOjIuNUdUL3M6V2lkdGgKPiA+ID4geDEpIDUyOjU0OjAwOjEyOjM0OjU2
Cj4gPiA+ICAgWyAgICAwLjg2ODc0MF0gZTEwMDBlIDAwMDA6MDA6MDEuMCBldGgwOiBJbnRlbChS
KSBQUk8vMTAwMCBOZXR3b3JrIENvbm5lY3Rpb24KPiA+ID4gICBbICAgIDAuODY5MDg3XSBlMTAw
MGUgMDAwMDowMDowMS4wIGV0aDA6IE1BQzogMywgUEhZOiA4LCBQQkEgTm86IDAwMDAwMC0wMDAK
PiA+ID4KPiA+ID4gSW4gdGhpcyBlbnZpcm9ubWVudCwgSSB1c2VkIGlwZXJmMyB0byB2ZXJpZnkg
dGhhdCB0aGUgZTEwMDBlIGZ1bmN0aW9ucwo+ID4gPiBjb3JyZWN0bHkuIFRoZSByZXN1bHQgc2hv
d3MgdGhhdCB0aGUgdGVzdCBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5Ogo+ID4KPiA+IFRoaXMgaXMg
Z3JlYXQsIHRoYW5rcyEKPiA+Cj4gPiBDYW4geW91IGNvbmZpcm0gdGhhdCB0aGUgaW9tbXUgd2Fz
IHNldCB0byB0cmFuc2xhdGluZyBmb3IgdGhpcyB0ZXN0Pwo+ID4KPiA+ICQgY2F0IC9zeXMva2Vy
bmVsL2lvbW11X2dyb3Vwcy8wL3R5cGUKPiA+IERNQS1GUQo+ID4gJCBjYXQgL3N5cy9rZXJuZWwv
aW9tbXVfZ3JvdXBzLzEvdHlwZQo+ID4gRE1BLUZRCj4gPgo+Cj4gU3VyZS4KPgo+ICMgY2F0IC9z
eXMva2VybmVsL2lvbW11X2dyb3Vwcy8wL3R5cGUKPiBETUEKPiAjIGNhdCAvc3lzL2tlcm5lbC9p
b21tdV9ncm91cHMvMS90eXBlCj4gRE1BCgpIaSBKYXNvbiwKClBsZWFzZSBkaXNyZWdhcmQgbXkg
cHJldmlvdXMgdGVzdCByZXBvcnQuIEkgcmVhbGl6ZWQgdGhhdCB0aGUgcHJldmlvdXMKcmVzdWx0
IHdhcyBpbmNvcnJlY3QgYmVjYXVzZSB0aGUgSU9NTVUgd2FzIGFjdHVhbGx5IHJ1bm5pbmcgaW4g
ImlkZW50aXR5Igptb2RlLCBzbyB0aGUgdGVzdCBkaWQgbm90IHZlcmlmeSB5b3VyIHBhZ2UgdGFi
bGUgcGF0Y2guIFNvcnJ5IGZvciBwcm92aWRpbmcgdGhlCmluY29ycmVjdCB0ZXN0IHJlc3VsdC4K
CiAgIyBjYXQgL3N5cy9rZXJuZWwvaW9tbXVfZ3JvdXBzLzAvdHlwZQogIGlkZW50aXR5CiAgIyBj
YXQgL3N5cy9rZXJuZWwvaW9tbXVfZ3JvdXBzLzEvdHlwZQogIGlkZW50aXR5CgpUaGlzIG9jY3Vy
cmVkIGJlY2F1c2UgdGhlIFJJU0MtViBJT01NVSBkcml2ZXIgaW4gdjYuMTkgZG9lcyBub3QgeWV0
CnN1cHBvcnQgTVNJIHJlZGlyZWN0aW9uLiBDb25zZXF1ZW50bHksIGRldmljZXMgdXNpbmcgTVNJ
IGZhaWwgdW5sZXNzIHRoZQp0cmFuc2xhdGlvbiBtb2RlIGlzIHNldCB0byBieXBhc3MgKGlkZW50
aXR5KSwgbWVhbmluZyBDT05GSUdfSU9NTVVfRE1BCndhcyBub3QgYWN0aXZlLgoKVG8gcHJvcGVy
bHkgdmVyaWZ5IHRoZSBwYXRjaCB3aXRoIERNQSB0cmFuc2xhdGlvbiBlbmFibGVkLCBJIGludGVn
cmF0ZWQKdGhlIE1TSS1yZWxhdGVkIHBhdGNoZXMgZnJvbSBBbmRyZXcgSm9uZXMncyBSRkMgc2Vy
aWVzIHRvIHVuYmxvY2sgdGhlCnRlc3QuCgogIEFuZHJldydzIHNlcmllczoKICBodHRwczovL2dp
dGh1Yi5jb20vam9uZXMtZHJldy9saW51eC9jb21taXRzL3Jpc2N2L2lvbW11LWlycWJ5cGFzcy1y
ZmMtdjIvCgogIE15IGVudGlyZSBzb3VyY2UgdHJlZSAoSmFzb24ncyBwYXRjaGVzICsgQW5kcmV3
J3MgTVNJIHBhdGNoZXMpIGlzIGhlcmU6CiAgaHR0cHM6Ly9naXRodWIuY29tL1ZpbmNlbnRaV0Mv
bGludXgvdHJlZS92Ni4xOS1pb21tdV9wdF9yaXNjdi10ZXN0CgpXaXRoIHRoaXMgY29kZWJhc2Us
IHRoZSBJT01NVSBncm91cCB0eXBlIGlzIG5vdyBjb3JyZWN0bHkgY29uZmlndXJlZCBhcwpETUE6
CgogICMgY2F0IC9zeXMva2VybmVsL2lvbW11X2dyb3Vwcy8wL3R5cGUKICBETUEKICAjIGNhdCAv
c3lzL2tlcm5lbC9pb21tdV9ncm91cHMvMS90eXBlCiAgRE1BCgpJIHJlLXJhbiB0aGUgaXBlcmYz
IHRlc3QgaW4gdGhpcyBlbnZpcm9ubWVudCwgYW5kIHRoZSB0ZXN0IHBhc3NlZApzdWNjZXNzZnVs
bHkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

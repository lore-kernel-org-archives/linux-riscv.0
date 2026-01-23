Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917BDD6CFB0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 03:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AydHZAYj7beAMsx7dN2dcY4qHGHuiSd7QBPAfFPCU/g=; b=dspVeHvbQatvOl
	QNL/2/ph0sCVAO2AHyCK2imaqPBjuroJm3wg87U6GLNVq7mEvVUHQ47TVHLLgImIEqt31HwiXYBDJ
	SuL7imoZ0mCjz2UJhvr06TOD981rQanruiiyjPJNeVoOf8hArlkDUIeEVA5LUyPGUA4ytukrUM5CV
	aNW12rFBCNJ/iMGxk35WWUxg5YUvzhk8h5weEucWsluSgsE7e/++KX8Ky1A/NKtFo1im/5rNBMhav
	d2l3w0OAEw/8Rjckrm94TZiKfMJWHcgcU/WFiuqWSGZ+PlcVQsQkPby3KGvc57Ubxra66BNrVyqHB
	pbjrJd7WnTrtLLmZbJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7Ui-000000084cp-0BiJ;
	Fri, 23 Jan 2026 03:05:56 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7Uf-000000084cE-0t1R
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 03:05:54 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-662b5db048cso491252eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 19:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769137552; cv=none;
        d=google.com; s=arc-20240605;
        b=I6zDszqdaoOScMh38jYMZuWukb78L4dFoHu0OBLdscb/S9V5iA3oyDMKZbiQ75v5m2
         eaWcu7jLTGyYSOh7pTXifqIzV9aFepQZhML2mTQSR/oLrklopm2/EWBD6Z1ol/N7pcAV
         NuGkTvjdnHa8G0MRFVjfg4Jlx4mWJHpCTMq1mKF1OMD2BnG1B4DSBv0TNNWmAyxWdHHg
         ISSy9+zi9ibxXHOs05rGvvRZerA/0BgRLjWWkcw5XL+7vYCditkkG6Qq/2LrKmgTeWFT
         nBnXwdASJYoZTCEYUdz3W3UjKRNGE1YUnuwCoytwizky/cTlVcH8G4rpHp6XCIpAZ5BL
         ZRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGEqT7UyTgtMNvCrnujktZSI0NxpTV7HktWMzKUJGvI=;
        fh=Tdq8B3V/LB+f/vdKufgAyTWAJJWFZdsZf33q94uCtdg=;
        b=eOUnZvFkgxg/ySn4PokC4BakS83RnyAgnyzfCL4Ic2QjI8Fs1znYeVZALbXa2Xy61N
         tkSQziq+m1FvcNbuGL0npXVnxQ6l3UBXyj2ZUvxhhvdkdr0fzUZBtYM5cyFp2xXxwuGQ
         ENfX3nPIdNjanW/U7R4liO12I0XBSABHhK5GfhKA646Jj7yFsE0dH+CmY/ueGXuYpYLE
         jgS3DBYJJgTgyP7bGDRsOcl15qeWCRmj0j3VdLFb50SatOAle02KryYCtrEnqUiH+8jW
         hDfHgw1yN1d6L7Fx0RqPXEJNorxGt/VEy24ofVT/EycjBjmdieWZQlNhAkCs/2S0h6cy
         stGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1769137552; x=1769742352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGEqT7UyTgtMNvCrnujktZSI0NxpTV7HktWMzKUJGvI=;
        b=hR6WSQ8iX8FiAD8+QTlpTD5aCKxriSOcRmVI1fqTn9nvt2xN4pTPxLJdcKDBG9yaVp
         vHCbmHy0VsiaY5OPiDU2O04KGBVex25DQTCtI+P4BiyKbIssI4zsVg18F0+YoA55+5C1
         pErrYfF3hSEbbyVRbYxS1RAXOZx5nHJtTqrPeixOwb4V1Gi9d7QabXhBr3xZ+91xOYIu
         I3gyJVAUgEqkE4R6cwcNU7fB/+MMBC8q3kdx0rn+suSIYpElO3nM4JaTJN+F+ijgpa+j
         D809WzNRwLD7TL2cYS/NYERlauWRGWJXjpxtm/t/p1nU8Gv1BZVe9ZGN11HRe4YWHmrb
         I4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769137552; x=1769742352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HGEqT7UyTgtMNvCrnujktZSI0NxpTV7HktWMzKUJGvI=;
        b=wOMmqT1dR4cK6ErvoKXDurWBAtCvEQx5D69Hmcr+P5FakRci6a216OaJ63NBM5CibD
         7RPSYguTMvtz2Xgk+WdP9WNPviMYriRNGNpxXWBxPJOQCd59gG7nsYt6SuqxTBz+zyzM
         DF/VVE0ueXLX6Vwo5uKV/FV0fqCduuE6z8rxHRuZ2N6UhIJuL35kUZgAeqvejPijfp6y
         DZmPz9Mb+7mcEb1whND0y2dlCbNVQ9iNjxMtn87Kh/xRqOOKaNr1j1MZTqbO3En+pR0m
         KaEeNO6z5kArp79PSPeb/VHO9qPiS2nHmMRc++GR6IQH6JXZN0Qj8bhuuvSz0t4nyfjs
         Y77Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAme/UETGLmuegrJDykKo2QMhiZd5aKOFu3SrIwnUL8d+a53vfZttHFVNh/DYrm4AC98Aao2tmJ80hYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPo0ERXoxYtnyCl3qX7YmNrZJaAObvS4ABvfR8W4LDJJKPoY5H
	zVC1y8ixA5h9KThAdrlIlLpH1ziPpwA9/rThEvpYGymLveuaExF4t74GkUBrblRFOrwp/h5zuiw
	o9am/hNvqH/V3+u3toL9m1v+ubBOUKuV7tgFYdGD9mg==
X-Gm-Gg: AZuq6aI4CLyAU5iJ6KXeBmHqXwaBgkGdoqnQEfh6OOE64mPCxzTLhOJAcq7vqNFxnM9
	ea+M3O+h2j/ZLHv1t1WIayynpuWUqdT3sFX2KjTDXr34hM44/+bLpTJVGY67jClCNRE+4al2YBq
	tgOatCLHgxXkptOP+QpB4yTMDHiFrSiASah8L3mGzXg48YgidVvO1lCz5r+r4mRxar6kvaQ+TGt
	rzPEPft74C0LV1a3Fvd669gY2fPM29xkBUkn3qfX7nNQgHE58/TzifgaNDHdf1qiwDormj0FQ==
X-Received: by 2002:a05:6820:1689:b0:65d:95d:2de2 with SMTP id
 006d021491bc7-662cab0b17fmr951053eaf.25.1769137551657; Thu, 22 Jan 2026
 19:05:51 -0800 (PST)
MIME-Version: 1.0
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <CABvJ_xiUK9BqUJS9-Sk1sS4vhVhyXN8P8NooZ0t_Zp7ycG0bAw@mail.gmail.com> <20260122153134.GO1134360@nvidia.com>
In-Reply-To: <20260122153134.GO1134360@nvidia.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 23 Jan 2026 11:05:40 +0800
X-Gm-Features: AZwV_Qg9IApxpDwG1qJn4LgmdvEEpNtmIvGulgwGbciwMW5SeFs7SpLra02DWaI
Message-ID: <CABvJ_xgSbK3omxT7XGJ0N7oEva6dQAJwZxRhsBqi44BRNZ3G5Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page table
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>, lihangjing@bytedance.com, 
	Xu Lu <luxu.kernel@bytedance.com>, patches@lists.linux.dev, 
	xieyongji@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_190553_269564_B70651A3 
X-CRM114-Status: GOOD (  14.81  )
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

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMTE6MzHigK9QTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bu
dmlkaWEuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSmFuIDIyLCAyMDI2IGF0IDA5OjQ2OjQ3QU0g
KzA4MDAsIFZpbmNlbnQgQ2hlbiB3cm90ZToKPiA+IEhpIEphc29uLAo+ID4KPiA+IEkgdGVzdGVk
IHRoaXMgcGF0Y2ggc2V0IG9uIG15IHNpZGUgd2l0aCB0aGUgUUVNVS12aXJ0IG1hY2hpbmUuCj4g
PiBJIHVzZWQgdGhlIGZvbGxvd2luZyBRRU1VIGNvbW1hbmQgZm9yIHRlc3Rpbmc6Cj4gPgo+ID4g
ICAkUUVNVS9xZW11LXN5c3RlbS1yaXNjdjY0IFwKPiA+ICAgICAtTSB2aXJ0LGFpYT1hcGxpYy1p
bXNpYyxhaWEtZ3Vlc3RzPTcsaW9tbXUtc3lzPW9uIC1tIDhHIC1ub2dyYXBoaWMgXAo+ID4gICAg
IC1iaW9zICRPUEVOU0JJX0lNQUdFIFwKPiA+ICAgICAtc2VyaWFsIG1vbjpzdGRpbyAtc2VyaWFs
IG51bGwgLW5vZ3JhcGhpYyBcCj4gPiAgICAgLWRldmljZSBlMTAwMGUsbmV0ZGV2PW5ldDAgXAo+
ID4gICAgIC1uZXRkZXYgdXNlcixpZD1uZXQwIFwKPiA+ICAgICAtY3B1IHJ2NjQsdj10cnVlLHZs
ZW49MjU2LHNzZGJsdHJwPXRydWUsc21kYmx0cnA9dHJ1ZSBcCj4gPiAgICAgLWRldmljZSAneyJk
cml2ZXIiOiJ2aXJ0aW8tOXAtZGV2aWNlIiwiZnNkZXYiOiJzaGFyZSIsIm1vdW50X3RhZyI6Imhv
c3QwIn0nCj4gPiBcCj4gPiAgICAgLWZzZGV2IGxvY2FsLGlkPXNoYXJlLHBhdGg9c2hhcmUsc2Vj
dXJpdHlfbW9kZWw9bWFwcGVkIFwKPiA+ICAgICAtYXBwZW5kICdjb25zb2xlPXR0eVMwIGVhcmx5
Y29uJyBcCj4gPiAgICAgLWtlcm5lbCAkS0VSTkVMX0lNQUdFIFwKPiA+ICAgICAtZ2RiIHRjcDo6
NjIzNCBcCj4gPiAgICAgLXNtcCA0Cj4gPgo+ID4gVGhlIGJvb3QgbG9nIHNob3dzIHRoYXQgdGhl
IGUxMDAwZSBpcyBzdWNjZXNzZnVsbHkgYWRkZWQgdG8gSU9NTVUgZ3JvdXAgMToKPiA+Cj4gPiAg
IFsgICAgMC43NTI4MDhdIHBjaSAwMDAwOjAwOjAwLjA6IEFkZGluZyB0byBpb21tdSBncm91cCAw
Cj4gPiAgIFsgICAgMC43NTMyNzldIHBjaSAwMDAwOjAwOjAxLjA6IEFkZGluZyB0byBpb21tdSBn
cm91cCAxCj4gPiAgIFsuLi5dCj4gPiAgIFsgICAgMC43NjMyMTJdIGUxMDAwZSAwMDAwOjAwOjAx
LjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAyKQo+ID4gICBbICAgIDAuNzY1MjQxXSBl
MTAwMGUgMDAwMDowMDowMS4wOiBJbnRlcnJ1cHQgVGhyb3R0bGluZyBSYXRlCj4gPiAoaW50cy9z
ZWMpIHNldCB0byBkeW5hbWljIGNvbnNlcnZhdGl2ZSBtb2RlCj4gPiAgIFsgICAgMC44NjgxMjBd
IGUxMDAwZSAwMDAwOjAwOjAxLjAgZXRoMDogKFBDSSBFeHByZXNzOjIuNUdUL3M6V2lkdGgKPiA+
IHgxKSA1Mjo1NDowMDoxMjozNDo1Ngo+ID4gICBbICAgIDAuODY4NzQwXSBlMTAwMGUgMDAwMDow
MDowMS4wIGV0aDA6IEludGVsKFIpIFBSTy8xMDAwIE5ldHdvcmsgQ29ubmVjdGlvbgo+ID4gICBb
ICAgIDAuODY5MDg3XSBlMTAwMGUgMDAwMDowMDowMS4wIGV0aDA6IE1BQzogMywgUEhZOiA4LCBQ
QkEgTm86IDAwMDAwMC0wMDAKPiA+Cj4gPiBJbiB0aGlzIGVudmlyb25tZW50LCBJIHVzZWQgaXBl
cmYzIHRvIHZlcmlmeSB0aGF0IHRoZSBlMTAwMGUgZnVuY3Rpb25zCj4gPiBjb3JyZWN0bHkuIFRo
ZSByZXN1bHQgc2hvd3MgdGhhdCB0aGUgdGVzdCBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5Ogo+Cj4g
VGhpcyBpcyBncmVhdCwgdGhhbmtzIQo+Cj4gQ2FuIHlvdSBjb25maXJtIHRoYXQgdGhlIGlvbW11
IHdhcyBzZXQgdG8gdHJhbnNsYXRpbmcgZm9yIHRoaXMgdGVzdD8KPgo+ICQgY2F0IC9zeXMva2Vy
bmVsL2lvbW11X2dyb3Vwcy8wL3R5cGUKPiBETUEtRlEKPiAkIGNhdCAvc3lzL2tlcm5lbC9pb21t
dV9ncm91cHMvMS90eXBlCj4gRE1BLUZRCj4KClN1cmUuCgojIGNhdCAvc3lzL2tlcm5lbC9pb21t
dV9ncm91cHMvMC90eXBlCkRNQQojIGNhdCAvc3lzL2tlcm5lbC9pb21tdV9ncm91cHMvMS90eXBl
CkRNQQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

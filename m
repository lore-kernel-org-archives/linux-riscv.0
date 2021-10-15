Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5304C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 12:43:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 965176108E
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 12:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 965176108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIWNHmcRvUsY96P/y2ECRMsDBICKNKayWxgRbuc4r6A=; b=iRP3BEQ61uTS0I
	fPR/yRWheKFFemQ04nwAGkRmoNPk81LFSxtf+HecI5qZIZ5Wp35DDt6I861CIyRle4lvtSuw6UI1d
	zGC1lQNcNFFwP4ZLZ5QNuOnvValgAKm/AH0i+w05hR1+UDKTAiq+dqKSTgLwuRCE9QaW1o6RQi2ZK
	AnOZGhmSekaG8Z+97iMvtHgLNzL9e6NZ6sbHlPe4Zr3SHfPemlE5YPZQTjSfQJsuvpDJxJPkWbkGN
	rkitE/PE8n2eBG9HIvaNFauEs4XDKS6Yd43acGbe/L9hSKRGQABNuYEotKqqt6Q7EMNf1lRKwxmoP
	duBK+Uc+7c0qEmH+sbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbMYA-006ygD-9I; Fri, 15 Oct 2021 12:43:02 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbMY7-006yd0-08
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 12:43:00 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E294D40018
 for <linux-riscv@lists.infradead.org>; Fri, 15 Oct 2021 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634301775;
 bh=n5foe9bmgDkFfFq3zSQcgI6TNmwb73rCwv2IOYhq6Zc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=uibEVoQr3KNSl1uYAwd8yP9pHal2pbcoPWpuhiSbjNJGljYt/3oY9kIJ932DL4GYD
 x0bRGh6E/39HMdNlIJOUk5/u1RiXiG1NHEibUACFiBghR5DOYUHXy0J9j1Z7iEHWk9
 aVFrKjASJEI2C0QQ6L1TDMhp4GmvhU77ShIyxj7qSuky+EwQUlfwBAoTc71TKovDI5
 oQOaFSvGExQ9OM6zkanKvHUS9sMe3AtSMskO7IaeBTupNiwXYAJoeauYD8HvjZUG6Z
 H9a9ddlnUh3BM4pGY8Ek1MPCc445TA8AV4wXagZWuNoTyQTQbUwqdPmDuzC5X5VJtB
 Dt+MW3lXFJ+AA==
Received: by mail-wr1-f72.google.com with SMTP id
 h99-20020adf906c000000b001644add8925so2710864wrh.0
 for <linux-riscv@lists.infradead.org>; Fri, 15 Oct 2021 05:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n5foe9bmgDkFfFq3zSQcgI6TNmwb73rCwv2IOYhq6Zc=;
 b=gvdMUbF78DcMSF9RVUdpkVrLwtARDCGlYjCV5457Sw/7P46X6qA1UAXgSi7Csa2qsb
 GNVO47+Sruxrbuhwl80nLKr5X1LcR1EWWwaT9Fi7RWGZmdRkFMBm48iUk38nGfS+c0No
 iq3CX0pDZznwayDYYfq4Euz9aJHR0XLzyz0S6383QdRMINvpj3GQi+NmwokRqEpVrjRh
 MEPsxUpewg8fBljCvgGidroegciHwy2bV/3m5KZ5SdCD0eZK/2jmBCuQjnmET3KvF3/J
 Lx0187lG2don+ENb3SBoQQKvHSXeYjNn20SY9aygo9Y+ijqM1APY9lfuJqwlf43OBT6N
 VLXQ==
X-Gm-Message-State: AOAM532y943e1mI9/wzbcAxC+obeDNluDd/3VAARLHjK1Kb6zf70NiUp
 N4ZKgvfg+QOFgg/uDniS4h0p2QfoRTFbJh+0BVh8wryb+l4ZXYe8oXiCRTC5peOJTYXLp/+kK2z
 2CISy02vcgbZazYOv0ZO6A7E6CSXIBCJIC+LfAPnuPLdSvw==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr12049084wmi.143.1634301774934; 
 Fri, 15 Oct 2021 05:42:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNVuMirSALcejYMmB27BxTdWSSxDP4ZYw9M5uBqnWOsxvVtvdVqqFUCaQrxhddccMSOHqJ7w==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr12049056wmi.143.1634301774736; 
 Fri, 15 Oct 2021 05:42:54 -0700 (PDT)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id g188sm4869796wmg.46.2021.10.15.05.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 05:42:54 -0700 (PDT)
Message-ID: <081176c0-5938-df1a-7828-d9ee1c270cbf@canonical.com>
Date: Fri, 15 Oct 2021 14:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Guo Ren <guoren@linux.alibaba.com>, Xiang W <wxjstz@126.com>,
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
References: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
 <CAEUhbmUSmi9mbiHpatBjGgRjrtyJPms9BRmyBPs5BWeVb7n1Nw@mail.gmail.com>
 <49af3dc8-0d1e-e82f-6df2-2bf8338acd3a@canonical.com>
 <D976B0F9-6AE4-4C04-8D52-75B24D6E4359@jrtc27.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <D976B0F9-6AE4-4C04-8D52-75B24D6E4359@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_054259_231977_3E087D05 
X-CRM114-Status: GOOD (  19.83  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMTUvMjEgMTQ6MTUsIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgo+IE9uIDE1IE9jdCAyMDIx
LCBhdCAxMjo1NCwgSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5v
bmljYWwuY29tPiB3cm90ZToKPj4KPj4gT24gMTAvMTUvMjEgMTI6MTQsIEJpbiBNZW5nIHdyb3Rl
Ogo+Pj4gT24gRnJpLCBPY3QgMTUsIDIwMjEgYXQgNjowOSBQTSBIZWlucmljaCBTY2h1Y2hhcmR0
Cj4+PiA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPiB3cm90ZToKPj4+Pgo+Pj4+
IFRoZSBDTElOVCBpbiB0aGUgVC1IRUFEIDl4eCBwcm9jZXNzb3JzIGRvIG5vdCBzdXBwb3J0IDY0
Yml0IG1taW8gYWNjZXNzIHRvCj4+Pj4gdGhlIE1USU1FUiBkZXZpY2UuIFRoZSBjdXJyZW50IHNj
aGVtYSBkb2VzIG5vdCBhbGxvdyB0byBzcGVjaWZ5IHRoaXMuCj4+Pj4KPj4+PiBPcGVuU0JJIGN1
cnJlbnRseSB1c2VzIGEgcHJvcGVydHkgJ2NsaW50LGhhcy1uby02NGJpdC1tbWlvJyB0byBpbmRp
Y2F0ZSB0aGUKPj4+PiByZXN0cmljdGlvbi4gU2FtdWFlbCBIb2xsYW5kIHN1Z2dlc3RlZCBpbgo+
Pj4+IGxpYjogdXRpbHMvdGltZXI6IFVzZSBzdGFuZGFyZCBwcm9wZXJ0eSB0byBzcGVjaWZ5IDMy
LWJpdCBJL08KPj4+PiBodHRwczovL2dpdGh1Yi5jb20vc21hZXVsL29wZW5zYmkvY29tbWl0L2I5
NWU5Y2Y3Y2Y5M2IwYWYxNmZjODkyMDQzNzhiYzU5ZmYzMDAwOGUKPj4+PiB0byB1c2UgInJlZy1p
by13aWR0aCA9IDw0PjsiIGFzIHRoZSByZWctaW8td2lkdGggcHJvcGVydHkgaXMgZ2VuZXJhbGx5
IHVzZWQKPj4+PiBpbiB0aGUgZGV2aWNldHJlZSBzY2hlbWEgZm9yIHN1Y2ggYSBjb25kaXRpb24u
Cj4+Pj4KPj4+PiBBIHJlbGVhc2UgY2FuZGlkYXRlIG9mIHRoZSBBQ0xJTlQgc3BlY2lmaWNhdGlv
biBpcyBhdmFpbGFibGUgYXQKPj4+PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWNs
aW50L3JlbGVhc2VzCj4+Pj4KPj4+PiBBZGQgcmVnLWlvLXdpZHRoIGFzIG9wdGlvbmFsIHByb3Bl
cnR5IHRvIHRoZSBTaUZpdmUgQ29yZSBMb2NhbCBJbnRlcnJ1cHRvci4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEhlaW5yaWNoIFNjaHVjaGFyZHQgPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fub25p
Y2FsLmNvbT4KPj4+PiAtLS0KPj4+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy90aW1lci9zaWZpdmUsY2xpbnQueWFtbCB8IDcgKysrKysrKwo+Pj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+Pj4+IGluZGV4
IGEzNTk1MmY0ODc0Mi4uMjY2MDEyZDg4N2I1IDEwMDY0NAo+Pj4+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+Pj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFt
bAo+Pj4+IEBAIC00MSw2ICs0MSwxMyBAQCBwcm9wZXJ0aWVzOgo+Pj4+ICAgICByZWc6Cj4+Pj4g
ICAgICAgbWF4SXRlbXM6IDEKPj4+Pgo+Pj4+ICsgIHJlZy1pby13aWR0aDoKPj4+PiArICAgIGRl
c2NyaXB0aW9uOiB8Cj4+Pj4gKyAgICAgIFNvbWUgQ0xJTlQgaW1wbGVtZW50YXRpb25zLCBlLmcu
IG9uIHRoZSBULUhFQUQgOXh4LCBvbmx5IHN1cHBvcnQKPj4+PiArICAgICAgMzJiaXQgYWNjZXNz
IGZvciBNVElNRVIuCj4+Pj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50MzIKPj4+PiArICAgIGNvbnN0OiA0Cj4+PiBCdXQgdGhpcyBpcyBub3QgYSAic2lm
aXZlLGNsaW50IiBhbnl3YXkuIFNob3VsZCB0aGVyZSBiZSBhIG5ldwo+Pj4gZHQtYmluZGluZ3Mg
Zm9yIFQtSGVhZCBjbGludCB2YXJpYW50Pwo+Pgo+PiBJIGFzc3VtZSBieSBuZXcgZHQtYmluZGlu
Z3MgdmFyaWFudCB5b3UgbWVhbjogQWRkIGEgbmV3IGNvbXBhdGlibGUgc3RyaW5nIGluIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbC4KPj4K
Pj4gVGhlIHZlbmRvciBEZWJpYW4gaW1hZ2UgdXNlczoKPj4gY29tcGF0aWJsZSA9ICJ7YWxsd2lu
bmVyLHN1bjIwaS1kMS1jbGludCIsICJzaWZpdmUsY2xpbnQw4oCdfTsKPiAKPiBJIGFzc3VtZSBC
aW4gbWVhbnMgdG8gc3RvcCBjYWxsaW5nIGl0IGEgc2lmaXZlLGNsaW50MCBhbmQgaW5zdGVhZCBo
YXZlCj4gc29tZXRoaW5nIGxpa2UKPiAKPiAgICAgICJhbGx3aW5uZXIsc3VuMjBpLWQxLWNsaW50
IiwgInRoZWFkLGNsaW50MCIKPiAKPiBhcyBpcyBiZWluZyBkb25lIGZvciB0aGVpciBub24tY29u
Zm9ybWluZyBQTElDLiBJdOKAmXMgd29ydGggcG9pbnRpbmcgb3V0Cj4gdGhhdCB0aGUgc2FtZSBp
cyB0cnVlIGhlcmU7IHRoZSBTaUZpdmUgQ0xJTlQgc3VwcG9ydHMgNjQtYml0IGFjY2Vzc2VzCj4g
b24gUlY2NCwgc28gdGhpcyBpcyBub3QgY29tcGF0aWJsZSB3aXRoIGEgU2lGaXZlIENMSU5ULiBN
b3Jlb3ZlciwgdGhlCj4gUklTQy1WIHNwZWMgd2FzIGNsZWFybHkgd3JpdHRlbiBpbiBhIHdheSB0
aGF0IGludGVuZGVkIDY0LWJpdCBhY2Nlc3Nlcwo+IHRvIGJlIHN1cHBvcnRlZCBmb3IgUlY2NCwg
dGhvdWdoIHdhcyBub3QgY29tcGxldGVseSBleHBsaWNpdCBhYm91dAo+IHRoYXQsIHdoaWNoIGhh
cyBub3cgYmVlbiByZXNvbHZlZCAoc2VlCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2
LWlzYS1tYW51YWwvaXNzdWVzLzYzOSksIHNvIHRoaXMgQ0xJTlQKPiB2aW9sYXRlcyB0aGUgb2J2
aW91cyBpbnRlbnQgb2YgdGhlIHByZS0xLjEyIHByaXZpbGVnZWQgc3BlY3MgKHNlZQo+IEFuZHJl
d+KAmXMgbWVzc2FnZSBpbiB0aGUgaXNzdWUsIHdoaWNoIGFncmVlcyB3aXRoIG15IHJlYWRpbmcp
Lgo+IAo+IEplc3MKPiAKClRoaXMgY29tbWVudCBpcyByZWZlcnJpbmcgdG8gdGhlIGRpc2N1c3Np
b24gaW4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNjkzYTYwOWMtNDI3OC04NGFiLThh
OWItNDQ4OTM2YmIxM2QwQHNob2xsYW5kLm9yZy8KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

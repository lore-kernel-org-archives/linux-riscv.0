Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A853AC3DA54
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ej4h/mJ6KBxHGnUTFiHQCycbYjzx/newrma945lOqmM=; b=tTXLvEutkV/bwj
	Eb3pjx5TFmFlQtuKtS8yc4Ooyd/hw3/FizU8mmDHF0cOAGh2OaBoQLhgaggWyCapbU/NtpD/TdGI9
	j53C097lBuFs/OHbc7+hdcEybmY1Ol/enB49w0Z8akMW6zLLE//xegtyE6UVDIoNMJij6nnqLNBng
	2HboHuA0U37YWIHfBamqm3BVZApn3uxaGlVBOte67e+fCVqC2HndEq11m+a468eisLZ/6KzDyPeVG
	3dSn36bwXHAq6PIOUjyHtorKw4pXUcGxSy7YZyUZB8gqqfLQgviTlZKLH6eiXYUj4rRDeEb5wZ6/n
	4ad1D05pxLcUFVmW4tVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWg5r-006o7S-2Z;
	Thu, 17 Aug 2023 16:43:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWg5m-006o41-2q
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 16:43:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bf0b24d925so10025365ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692290603; x=1692895403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PB2Z3ZbGV4CX3loEYdldkKXA/GdXJ2Xk4SFBen/iuYc=;
        b=UkPo1ev2iFCUnViPY9CAmyGbARWlLPdYjzEHciwuGnWv+TERXIi7p0QeiMQy/DyubO
         /swhCSiHiMi8s1QoBNd0FmHYh6SxLxZcH+hR2rrkjzNmXLvuEPtrk42T1z9H/Zlf3RBp
         8E3zZ3HyUDJhozM+itzEaWxM8ccPGucc78DlRvNKf32VlR0lWSX0C+PZVJCGvJMra+nw
         019ad5Xd6cA4y5y47ViHm+4NEXkiFnbKaMQI3bB2EEnS6QMg/4Q9zqDXFaVf+R6vNQeO
         5cazeXhgiGGniVDEzESnpxYCExIJahfNEIZp/bWcMm1P/01MSYVA83JSMdLj2/MCwaLh
         CrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692290603; x=1692895403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PB2Z3ZbGV4CX3loEYdldkKXA/GdXJ2Xk4SFBen/iuYc=;
        b=AX4cwIcwWimyzSoyRXo73Q/IfG6ZJDGOBl06R6vg37PI1Gv+LVu5YccwWt9jIlN+ck
         M0Vzi3DV0i3sCrTWdLaNE6rx9JL4HK28ryStpkYXR2Ghta6zTL4vXjeWMcovnZKIHH8D
         Ox6SZ7cXdtT2XViE9D0bonwYBdosCRCqztKQEyK9OooT8M5gPmnZ2hVP5+3VbQv670dd
         ClrtMoa8BrDJCIWvxocY3YGIckcqiHmdscDk1ORMMbdlmsqBsNOQ66bryglEflZdL4Pc
         GcvM5aOjl9GflXM+rigplkOMMk+VcEcqGkX1WXB0TLS/IfZIGeVLyYGJzT4GL+jTLorE
         1zMg==
X-Gm-Message-State: AOJu0YxklFYsBCo9OH7qCu9cyzihoN/LgKQtmtpyaMrZgf14jxB83NOL
	5Wzv9Xo6BMuQrHStfWdjMINeBA==
X-Google-Smtp-Source: AGHT+IEFcMgadb/7XKpYQOh6C/SwkWpgiE3QottPAATvfPQw1OPO0Y7EvudzdN/WWJ1s3h5LB3UqFA==
X-Received: by 2002:a17:902:654e:b0:1bc:15ea:ced8 with SMTP id d14-20020a170902654e00b001bc15eaced8mr5488035pln.54.1692290602969;
        Thu, 17 Aug 2023 09:43:22 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:4c48:92d8:2b81:b1ae])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001b7cbc5871csm15411677pli.53.2023.08.17.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 09:43:22 -0700 (PDT)
Date: Thu, 17 Aug 2023 09:43:16 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, bpf@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	Nam Cao <namcaov@gmail.com>
Subject: Re: [PATCH 00/10] RISC-V: Refactor instructions
Message-ID: <ZN5OJO/xOWUjLK2w@ghost>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
 <20230804-2c57bddd6e87fdebc20ff9d5@orel>
 <ZM00UYDzEAz/JT3n@ghost>
 <ZN1qXlLp6qfpBeGF@ghost>
 <12FAB5A9-5723-4A5B-8729-75D8A38921B9@jrtc27.com>
 <46884D2C-F3AA-4A83-8295-AE5C0F58FE13@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46884D2C-F3AA-4A83-8295-AE5C0F58FE13@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_094326_922709_AB7C9BC4 
X-CRM114-Status: GOOD (  48.92  )
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

T24gVGh1LCBBdWcgMTcsIDIwMjMgYXQgMDU6MDU6NDVBTSArMDEwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gMTcgQXVnIDIwMjMsIGF0IDA0OjU3LCBKZXNzaWNhIENsYXJrZSA8anJ0YzI3
QGpydGMyNy5jb20+IHdyb3RlOgo+ID4gCj4gPiBPbiAxNyBBdWcgMjAyMywgYXQgMDE6MzEsIENo
YXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4+IAo+ID4+IE9u
IEZyaSwgQXVnIDA0LCAyMDIzIGF0IDEwOjI0OjMzQU0gLTA3MDAsIENoYXJsaWUgSmVua2lucyB3
cm90ZToKPiA+Pj4gT24gRnJpLCBBdWcgMDQsIDIwMjMgYXQgMTI6Mjg6MjhQTSArMDMwMCwgQW5k
cmV3IEpvbmVzIHdyb3RlOgo+ID4+Pj4gT24gVGh1LCBBdWcgMDMsIDIwMjMgYXQgMDc6MTA6MjVQ
TSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4+Pj4+IFRoZXJlIGFyZSBudW1lcm91
cyBzeXN0ZW1zIGluIHRoZSBrZXJuZWwgdGhhdCByZWx5IG9uIGRpcmVjdGx5Cj4gPj4+Pj4gbW9k
aWZ5aW5nLCBjcmVhdGluZywgYW5kIHJlYWRpbmcgaW5zdHJ1Y3Rpb25zLiBNYW55IG9mIHRoZXNl
IHN5c3RlbXMKPiA+Pj4+PiBoYXZlIHJld3JpdHRlbiBjb2RlIHRvIGRvIHRoaXMuIFRoaXMgcGF0
Y2ggd2lsbCBkZWxlZ2F0ZSBhbGwgaW5zdHJ1Y3Rpb24KPiA+Pj4+PiBoYW5kbGluZyBpbnRvIGlu
c24uaCBhbmQgcmVnLmguIEFsbCBvZiB0aGUgY29tcHJlc3NlZCBpbnN0cnVjdGlvbnMsIFJWSSwK
PiA+Pj4+PiBaaWNzciwgTSwgQSBpbnN0cnVjdGlvbnMgYXJlIGluY2x1ZGVkLCBhcyB3ZWxsIGFz
IGEgc3Vic2V0IG9mIHRoZSBGLEQsUQo+ID4+Pj4+IGV4dGVuc2lvbnMuCj4gPj4+Pj4gCj4gPj4+
Pj4gLS0tCj4gPj4+Pj4gVGhpcyBpcyBtb2RpZnlpbmcgY29kZSB0aGF0IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyMzA3MzExODM5MjUuMTUyMTQ1LTEtbmFtY2FvdkBnbWFpbC5jb20v
Cj4gPj4+Pj4gaXMgYWxzbyB0b3VjaGluZy4KPiA+Pj4+PiAKPiA+Pj4+PiAtLS0KPiA+Pj4+PiBU
ZXN0aW5nOgo+ID4+Pj4+IAo+ID4+Pj4+IFRoZXJlIGFyZSBhIGxvdCBvZiBzdWJzeXN0ZW1zIHRv
dWNoZWQgYW5kIEkgaGF2ZSBub3QgdGVzdGVkIGV2ZXJ5Cj4gPj4+Pj4gaW5kaXZpZHVhbCBpbnN0
cnVjdGlvbi4gSSBkaWQgYSBsb3Qgb2YgY29weS1wYXN0aW5nIGZyb20gdGhlIFJJU0MtViBzcGVj
Cj4gPj4+Pj4gc28gb3Bjb2RlcyBhbmQgc3VjaCBzaG91bGQgYmUgY29ycmVjdAo+ID4+Pj4gCj4g
Pj4+PiBIb3cgYWJvdXQgd2UgY3JlYXRlIG1hY3JvcyB3aGljaCBnZW5lcmF0ZSBlYWNoIG9mIHRo
ZSBmdW5jdGlvbnMgYW4KPiA+Pj4+IGluc3RydWN0aW9uIG5lZWRzLCBlLmcuIHJpc2N2X2luc25f
aXNfKigpLCBldGMuIGJhc2VkIG9uIHRoZSBvdXRwdXQgb2YKPiA+Pj4+IFsxXS4gSSBrbm93IGJh
c2ljYWxseSBub3RoaW5nIGFib3V0IHRoYXQgcHJvamVjdCwgYnV0IGl0IGxvb2tzIGxpa2UgaXQK
PiA+Pj4+IGNyZWF0ZXMgbW9zdCB0aGUgZGVmaW5lcyB0aGlzIHNlcmllcyBpcyBjcmVhdGluZyBm
cm9tIHdoYXQgd2UgW2hvcGVdIHRvCj4gPj4+PiBiZSBhbiBhdXRob3JpdGF0aXZlIHNvdXJjZS4g
SSBhbHNvIGFzc3VtZSB0aGF0IGlmIHdlIGRvbid0IGxpa2UgdGhlCj4gPj4+PiBjdXJyZW50IG91
dHB1dCBmb3JtYXQsIHRoZW4gd2UgY291bGQgcHJvYmFibHkgcG9zdCBwYXRjaGVzIHRvIHRoZSBw
cm9qZWN0Cj4gPj4+PiB0byBnZXQgdGhlIGZvcm1hdCB3ZSB3YW50LiBGb3IgZXhhbXBsZSwgd2Ug
Y291bGQgbWF5YmUgcHJvcG9zZSBhbiAibGMiCj4gPj4+PiBmb3JtYXQgZm9yICJMaW51eCBDIi4K
PiA+Pj4gVGhhdCdzIGEgZ3JlYXQgaWRlYSwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IGV4aXN0ZWQh
Cj4gPj4gSSBoYXZlIGRpc2NvdmVyZWQgdGhhdCB0aGUgcmlzY3Ytb3Bjb2RlcyByZXBvc2l0b3J5
IGlzIG5vdCBpbiBhIHN0YXRlCj4gPj4gdGhhdCBtYWtlcyBpdCBoZWxwZnVsLiBJZiBpdCB3ZXJl
IHdvcmthYmxlLCBpdCB3b3VsZCBtYWtlIGl0IGVhc3kgdG8KPiA+PiBpbmNsdWRlIGEgIkxpbnV4
IEMiIGZvcm1hdC4gSSBoYXZlIGhhZCBhIHB1bGwgcmVxdWVzdCBvcGVuIG9uIHRoZSByZXBvCj4g
Pj4gZm9yIHR3byB3ZWVrcyBub3cgYW5kIHRoZSBwZXJzb24gd2hvIG1haW50YWlucyB0aGUgcmVw
byBoYXMgbm90Cj4gPj4gaW50ZXJhY3RlZC4KPiA+IAo+ID4gSHVoPyBBbmRyZXcgaGFzIHJlcGxp
ZWQgdG8geW91IHR3aWNlIG9uIHlvdXIgUFIsIGFuZCB3YXMgdGhlIGxhc3Qgb25lIHRvCj4gPiBj
b21tZW50LiBUaGF04oCZcyBoYXJkbHkg4oCcaGFzIG5vdCBpbnRlcmFjdGVk4oCdLgo+ID4gCkkg
c2hvdWxkIGhhdmUgYmVlbiBtb3JlIGNsZWFyIGJlY2F1c2UgQW5kcmV3IHdhcyB2ZXJ5IHJlc3Bv
bnNpdmUuCkhvd2V2ZXIsIE5lZWwgR2FsYSBhcHBlYXJzIHRvIGJlIHRoZSAibWFpbnRhaW5lciIg
aW4gdGhlIHNlbnNlIHRoYXQKQW5kcmV3IGRlZmVycyB3aGF0IGdldHMgbWVyZ2VkIGludG8gdGhl
IHJlcG8gdG8gaGltLiBOZWVsIGhhcyBub3QKcHJvdmlkZWQgYW55IGZlZWRiYWNrLCBhbmQgaGUg
bmVlZHMgdG8gY29tbWVudCBiZWZvcmUgQW5kcmV3IHdpbGwgbWVyZ2UKYW55dGhpbmcgaW4uCj4g
Pj4gQXQgbWluaW11bSwgaW4gb3JkZXIgZm9yIGl0IHRvIGJlIHVzZWZ1bCBpdCB3b3VsZCBuZWVk
IGFuIGFiaWxpdHkgdG8KPiA+PiBkZXNjcmliZSB0aGUgYml0IG9yZGVyIG9mIGltbWVkaWF0ZXMg
aW4gYW4gaW5zdHJ1Y3Rpb24gYW5kIGluY2x1ZGUgc2NyaXB0Cj4gPj4gYXJndW1lbnRzIHRvIHNl
bGVjdCB3aGljaCBpbnN0cnVjdGlvbnMgc2hvdWxkIGJlIGluY2x1ZGVkLiBUaGVyZSBpcyBhCj4g
Pj4gIkMiIGZvcm1hdCwgYnV0IGl0IGlzIGFjdHVhbGx5IGp1c3QgYSBTcGlrZSBmb3JtYXQuCj4g
PiAKPiA+IFNvIGV4dGVuZCBpdD8gT3IgZG8gc29tZXRoaW5nIHdpdGggUUVNVeKAmXMgZXF1aXZh
bGVudCB0aGF0IGV4cHJlc3NlcyBpdC4KWWVzLCB0aGF0IGlzIGEgcG9zc2liaWxpdHkuIFRvIG15
IGtub3dsZWRnZSBHQ0MgYW5kIHRoZSBzcGVjIGdlbmVyYXRvcgpoYXZlIG1vdmVkIGF3YXkgZnJv
bSB1c2luZyB0aGlzIHJlcG8uIElzIGl0IHN0aWxsIHVzZWQgYnkgUUVNVT8KPiAKPiBOb3RlIHRo
YXQgZXZlcnkgZmllbGQgYWxyZWFkeSBpZGVudGlmaWVzIHRoZSBiaXQgb3JkZXIgKG9yLCBmb3Ig
dGhlCj4gY2FzZSBvZiBjb21wcmVzc2VkIGluc3RydWN0aW9ucywgcmVnaXN0ZXIgcmVzdHJpY3Rp
b25zKSBzaW5jZSB0aGF04oCZcwo+IG5lZWRlZCB0byBwcm9kdWNlIHRoZSBvbGQgTGFUZVggaW5z
dHJ1Y3Rpb24gc2V0IGxpc3RpbmdzOyB0aGF04oCZcyB3aHkKPiB0aGVyZeKAmXMgamltbTIwIHZz
IGltbTIwLCBmb3IgZXhhbXBsZS4gT25lIGNvdWxkIHN1cmVseSBlbmNvZGUgdGhhdCBpbgo+IFB5
dGhvbiBhbmQgZ2VuZXJhdGUgdGhlIExhVGVYIHN0cmluZ3MgZnJvbSB0aGUgUHl0aG9uLCBtYWtp
bmcgdGhlCj4gZGV0YWlscyBvZiB0aGUgZW5jb2RpbmdzIGF2YWlsYWJsZSBlbHNld2hlcmUuIE9y
IGp1c3QgaGF2ZSB5b3VyIG93bgo+IG1hcHBpbmcgZnJvbSBuYW1lIHRvIHdoYXRldmVyIHlvdSBu
ZWVkLiBCdXQsIGVpdGhlciB3YXksIHRoZQo+IGluZm9ybWF0aW9uIHNob3VsZCBhbGwgYmUgdGhl
cmUgdG9kYXkgaW4gdGhlIGlucHV0IGZpbGVzLCBpdOKAmXMganVzdCBhCj4gbWF0dGVyIG9mIGV4
dGVuZGluZyB0aGUgc2NyaXB0IHRvIHByb2R1Y2Ugd2hhdGV2ZXIgeW91IHdhbnQgZnJvbSB0aGVt
LgpBbGwgb2YgdGhlIExhVGVYIGJpdCBvcmRlcnMgd2VyZSBoYXJkY29kZWQgaW4gc3RyaW5ncy4g
QXMgc3VjaCwgdGhlIGJpdApvcmRlciBpcyBkZXNjcmliZWQgZm9yIHRoZSBMYVRlWCBmb3JtYXQg
YnV0IG5vdCBpbiBnZW5lcmFsLiBJdCB3b3VsZCBub3QKbWFrZSBzZW5zZSB0byBoYXJkY29kZSB0
aGVtIGEgc2Vjb25kIHRpbWUgZm9yIHRoZSBvdXRwdXQgb2YgdGhlIExpbnV4CmdlbmVyYXRpb24u
IFlvdSBjYW4gc2VlIHRoZSBzdHJpbmdzIGJ5IHNlYXJjaGluZyBmb3IgJ2xhdGV4X21hcHBpbmcn
IGluCnRoZSBjb25zdGFudHMucHkgZmlsZS4KCkl0IHNlZW1zIHRvIG1lIHRoYXQgaXQgd2lsbCBi
ZSBzaWduaWZpY2FudGx5IG1vcmUgY2hhbGxlbmdpbmcgdG8gdXNlCnJpc2N2LW9wY29kZXMgdGhh
biBpdCB3b3VsZCBmb3IgcGVvcGxlIHRvIGp1c3QgaGFuZCBjcmVhdGUgdGhlIG1hY3Jvcwp0aGF0
IHRoZXkgbmVlZC4KCi0gQ2hhcmxpZQo+IAo+ID4gSmVzcwo+ID4gCj4gPj4gTm9uZXRoZWxlc3Ms
IGl0Cj4gPj4gc2VlbXMgbGlrZSBpdCBpcyBwcm9oaWJpdGl2ZSB0byB1c2UgaXQuCj4gPj4+PiAK
PiA+Pj4+IEknZCBhbHNvIHJlY29tbWVuZCBvbmx5IGltcG9ydGluZyB0aGUgZ2VuZXJhdGVkIGRl
ZmluZXMgYW5kIGdlbmVyYXRpbmcKPiA+Pj4+IHRoZSBmdW5jdGlvbnMgdGhhdCB3aWxsIGFjdHVh
bGx5IGhhdmUgaW1tZWRpYXRlIGNvbnN1bWVycyBvciBhcmUgcGFydCBvZgo+ID4+Pj4gYSBzZXQg
b2YgZGVmaW5lcyB0aGF0IGhhdmUgaW1tZWRpYXRlIGNvbnN1bWVycy4gRWFjaCBjb25zdW1lciBv
ZiBuZXcKPiA+Pj4+IGluc3RydWN0aW9ucyB3aWxsIGJlIHJlc3BvbnNpYmxlIGZvciBnZW5lcmF0
aW5nIGFuZCBpbXBvcnRpbmcgdGhlIGRlZmluZXMKPiA+Pj4+IGFuZCBhZGRpbmcgdGhlIHJlc3Bl
Y3RpdmUgbWFjcm8gaW52b2NhdGlvbnMgdG8gZ2VuZXJhdGUgdGhlIGZ1bmN0aW9ucy4KPiA+Pj4+
IFRoaXMgc2VyaWVzIGNhbiBhbHNvIHRha2UgdGhhdCBhcHByb2FjaCwgaS5lLiBjb252ZXJ0IG9u
ZSBzZXQgb2YKPiA+Pj4+IGluc3RydWN0aW9ucyBhdCBhIHRpbWUsIGVhY2ggaW4gYSBzZXBhcmF0
ZSBwYXRjaC4KPiA+Pj4gU2luY2UgSSB3YXMgaGFuZC13cml0aW5nIGV2ZXJ5dGhpbmcgYW5kIGNv
cHlpbmcgaXQgd2Fzbid0IHRvbyBtdWNoCj4gPj4+IGVmZm9ydCB0byBqdXN0IGNvcHkgYWxsIG9m
IHRoZSBpbnN0cnVjdGlvbnMgZnJvbSBhIGdyb3VwLiBIb3dldmVyLCBmcm9tCj4gPj4+IGEgdGVz
dGluZyBzdGFuZHBvaW50IGl0IG1ha2VzIHNlbnNlIHRvIGV4Y2x1ZGUgaW5zdHJ1Y3Rpb25zIG5v
dCB5ZXQgaW4KPiA+Pj4gdXNlLgo+ID4+Pj4gCj4gPj4+PiBbMV0gaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2L3Jpc2N2LW9wY29kZXMKPiA+Pj4+IAo+ID4+Pj4gVGhhbmtzLAo+ID4+Pj4gZHJldwo+
ID4+Pj4gCj4gPj4+PiAKPiA+Pj4+PiAsIGJ1dCB0aGUgY29uc3RydWN0aW9uIG9mIGV2ZXJ5Cj4g
Pj4+Pj4gaW5zdHJ1Y3Rpb24gaXMgbm90IGZ1bGx5IHRlc3RlZC4KPiA+Pj4+PiAKPiA+Pj4+PiB2
ZWN0b3I6IENvbXBpbGVkIGFuZCBib290ZWQKPiA+Pj4+PiAKPiA+Pj4+PiBqdW1wX2xhYmVsOiBF
bnN1cmVkIHN0YXRpYyBrZXlzIGZ1bmN0aW9uIGFzIGV4cGVjdGVkLgo+ID4+Pj4+IAo+ID4+Pj4+
IGtnZGI6IEF0dGVtcHRlZCB0byBydW4gdGhlIHByb3ZpZGVkIHRlc3RzIGJ1dCB0aGV5IGZhaWxl
ZCBldmVuIHdpdGhvdXQKPiA+Pj4+PiBteSBjaGFuZ2VzCj4gPj4+Pj4gCj4gPj4+Pj4gbW9kdWxl
OiBMb2FkZWQgYW5kIHVubG9hZGVkIG1vZHVsZXMKPiA+Pj4+PiAKPiA+Pj4+PiBwYXRjaC5jOiBF
bnN1cmVkIGtlcm5lbCBib290ZWQKPiA+Pj4+PiAKPiA+Pj4+PiBrcHJvYmVzOiBVc2VkIGEga3By
b2JpbmcgbW9kdWxlIHRvIHByb2JlIGphbHIsIGF1aXBjLCBhbmQgYnJhbmNoCj4gPj4+Pj4gaW5z
dHJ1Y3Rpb25zCj4gPj4+Pj4gCj4gPj4+Pj4gbm9tbXUgbWlzYWxpZ25lZCBhZGRyZXNzZXM6IEtl
cm5lbCBib290cwo+ID4+Pj4+IAo+ID4+Pj4+IGt2bTogUmFuIEtWTSBzZWxmdGVzdHMKPiA+Pj4+
PiAKPiA+Pj4+PiBicGY6IEtlcm5lbCBib290cy4gTW9zdCBvZiB0aGUgaW5zdHJ1Y3Rpb25zIGFy
ZSBleGNsdXNpdmVseSB1c2VkIGJ5IEJQRgo+ID4+Pj4+IGJ1dCBJIGFtIHVuc3VyZSBvZiB0aGUg
YmVzdCB3YXkgb2YgdGVzdGluZyBCUEYuCj4gPj4+Pj4gCj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTog
Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+Pj4+PiAKPiA+Pj4+PiAt
LS0KPiA+Pj4+PiBDaGFybGllIEplbmtpbnMgKDEwKToKPiA+Pj4+PiAgICAgUklTQy1WOiBFeHBh
bmQgaW5zdHJ1Y3Rpb24gZGVmaW5pdGlvbnMKPiA+Pj4+PiAgICAgUklTQy1WOiB2ZWN0b3I6IFJl
ZmFjdG9yIGluc3RydWN0aW9ucwo+ID4+Pj4+ICAgICBSSVNDLVY6IFJlZmFjdG9yIGp1bXAgbGFi
ZWwgaW5zdHJ1Y3Rpb25zCj4gPj4+Pj4gICAgIFJJU0MtVjogS0dEQjogUmVmYWN0b3IgaW5zdHJ1
Y3Rpb25zCj4gPj4+Pj4gICAgIFJJU0MtVjogbW9kdWxlOiBSZWZhY3RvciBpbnN0cnVjdGlvbnMK
PiA+Pj4+PiAgICAgUklTQy1WOiBSZWZhY3RvciBwYXRjaCBpbnN0cnVjdGlvbnMKPiA+Pj4+PiAg
ICAgUklTQy1WOiBub21tdTogUmVmYWN0b3IgaW5zdHJ1Y3Rpb25zCj4gPj4+Pj4gICAgIFJJU0Mt
Vjoga3ZtOiBSZWZhY3RvciBpbnN0cnVjdGlvbnMKPiA+Pj4+PiAgICAgUklTQy1WOiBicGY6IFJl
ZmFjdG9yIGluc3RydWN0aW9ucwo+ID4+Pj4+ICAgICBSSVNDLVY6IFJlZmFjdG9yIGJ1ZyBhbmQg
dHJhcHMgaW5zdHJ1Y3Rpb25zCj4gPj4+Pj4gCj4gPj4+Pj4gYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9idWcuaCAgICAgICAgICAgICB8ICAgMTggKy0KPiA+Pj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2luc24uaCAgICAgICAgICAgIHwgMjc0NCArKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0KPiA+Pj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3JlZy5oICAgICAgICAgICAgIHwgICA4
OCArCj4gPj4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwvanVtcF9sYWJlbC5jICAgICAgICAgICB8ICAg
MTMgKy0KPiA+Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMgICAgICAgICAgICAgICAgIHwg
ICAxMyArLQo+ID4+Pj4+IGFyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jICAgICAgICAgICAgICAg
fCAgIDgwICstCj4gPj4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYyAgICAgICAgICAgICAg
ICB8ICAgIDMgKy0KPiA+Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jICAg
ICAgIHwgICAxMyArLQo+ID4+Pj4+IGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9zaW11bGF0ZS1p
bnNuLmMgfCAgMTAwICstCj4gPj4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMu
YyAgICAgICB8ICAgIDUgKy0KPiA+Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAg
ICAgICAgICAgIHwgICAgOSArLQo+ID4+Pj4+IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYyAgICAgfCAgMjE4ICstLQo+ID4+Pj4+IGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5j
ICAgICAgICAgICAgICAgfCAgICA1ICstCj4gPj4+Pj4gYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNu
LmMgICAgICAgICAgICAgICB8ICAyODEgKy0tCj4gPj4+Pj4gYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dC5oICAgICAgICAgICAgICAgICB8ICA3MDcgKy0tLS0tLS0KPiA+Pj4+PiAxNSBmaWxlcyBjaGFu
Z2VkLCAyODI1IGluc2VydGlvbnMoKyksIDE0NzIgZGVsZXRpb25zKC0pCj4gPj4+Pj4gLS0tCj4g
Pj4+Pj4gYmFzZS1jb21taXQ6IDVkMGMyMzBmMWRlOGM3NTE1YjY1NjdkOWFmYmExZjE5NmZiNGUy
ZjQKPiA+Pj4+PiBjaGFuZ2UtaWQ6IDIwMjMwODAxLW1hc3Rlci1yZWZhY3Rvci1pbnN0cnVjdGlv
bnMtdjQtNDMzYWEwNDBkYTAzCj4gPj4+Pj4gLS0gCj4gPj4+Pj4gLSBDaGFybGllCj4gPj4+Pj4g
Cj4gPj4+Pj4gCj4gPj4+Pj4gLS0gCj4gPj4+Pj4ga3ZtLXJpc2N2IG1haWxpbmcgbGlzdAo+ID4+
Pj4+IGt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPj4+Pj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YKPiA+PiAKPiA+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+ID4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4g
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

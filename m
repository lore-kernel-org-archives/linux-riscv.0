Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89001E82CA5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+QjaZM+xL8EayBj1TmJPEqHnsIbHjk8DL71bluuGag=; b=Sr7aUizy+tTAGx
	W9xbDrhUqPMnNHKPhB4E/16X6bsAQ72J5Q3NRET5CUtikC04Om+Z3hV0mle/n+oZqonlCOg5Jr/iF
	nSxDB4yXp1AXovg3HgM1jq+UB/z94qw/t2pY8fgzsZxd6AOvWDYF7xxOdUHduIOeHV51a69FrGBMY
	IhKIYMwZ5OTF1iTTgLz+gHzWsW/8FUxBltRQ7kJLomL85jLBXatDbRA2rzAiXLZlR0zhrVmJGEZ5O
	spMBkFc3nZpz5CqNBsEKa1sDlSAMKWuGO50yj9A7SUxuAiLuqpJvLsGx4Nqry8crToDVtwWQgfwam
	y4IEMCBkkVzR20nI6FCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWRA-001Eq3-0F;
	Wed, 27 Sep 2023 15:26:52 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWR7-001Eox-0G
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 15:26:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-27740ce6c76so5111578a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 08:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695828407; x=1696433207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijGPnahnzmrBSaCobVNQmuUKYt7yPdCWIYWpIr/wTF8=;
        b=Qkwl7k/acyy7hBVasqAMju5hnQCyicTPiQmH6P0czLPkl+zaq9z7+kNa9Y54G9i4WU
         MNYFBUlJPbw/mZpzOdmAdAI6NaFmCc+c/6uhcXISNaHYZPiK1s/OBRCXKF1R47cJ1DP6
         qro6KJr5M/PcL6qR9sCt8BbzTrhK9GCfTBDeyYwSmWxHW2Zm528XSXxbIi3zqMPrSMTE
         4M25d1EGOpjS64aDaD9LKBzdngRZCecLgWkN3DvOVgBS5nmLcrsPk0tMW72gxigcBMvG
         G0DLH/O5+aFIPTPbIMpHYuP3PT8ZSTOQWPBKfGlQtP8PlQHAfkstxBVjyQN8+/pm/5jl
         NaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695828407; x=1696433207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijGPnahnzmrBSaCobVNQmuUKYt7yPdCWIYWpIr/wTF8=;
        b=qZzg6xRvRoErMpxT8mgvSdIs0w3JZ1yvx4wj/CQkiv9u3pniU/tfsfIJ/ijXJ4x9W2
         weL6zwH0G7W4QzrFVWcxvsUI915pJt6axo7Z++ZWwxCxKC7SQPyXKVz09XWEAdIgC5dO
         m+AZsjRQp/e63MXvw8B62vaHO11xmv9aj72HNUF7zK0unA0H1oBcK0LexHIBFaXGBzV5
         FTFDUQAy8iMhiE8qrl5/1Bo4jG31Hj+hS2dwSgmun389RgkOSoKYLWgv41KxX/taId+4
         yG+ng20LSWh3sd9GO78iRLZrZIuEo4fpgXY7HjSUNr20eLIQ6Xee0yxkAoMVVfJV+Nn1
         u/SA==
X-Gm-Message-State: AOJu0YzpIRXRl0LM6tzwyjocSIesn18/QdWMe2n7CXRwU2wo1rQ3zwaQ
	pdA8tjBoaBTWCYL3OFMyA4b1BNK6ojXMoEDBawrGWg==
X-Google-Smtp-Source: AGHT+IFU1LUpaO7sP7SIqPuvetp24KKi4LWrjjiTg6yxaFt1J+qS7fbA4ID8HUUXxvqmzStEvujat718B0LrMVGcjMI=
X-Received: by 2002:a17:90a:4983:b0:268:1b60:5031 with SMTP id
 d3-20020a17090a498300b002681b605031mr2049707pjh.12.1695828407438; Wed, 27 Sep
 2023 08:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230927-snowcap-stadium-2f6aeffac59e@spud> <mhng-ed1b5d0a-469c-43e3-a0fe-b8e498cde538@palmer-ri-x1c9>
In-Reply-To: <mhng-ed1b5d0a-469c-43e3-a0fe-b8e498cde538@palmer-ri-x1c9>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 27 Sep 2023 20:56:35 +0530
Message-ID: <CAK9=C2Xx76i-FmTm2Qt_9PssLrLL3zUDvxOUZRyyEQZzDV7JDw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] KVM RISC-V Conditional Operations
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, pbonzini@redhat.com, atishp@atishpatra.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, shuah@kernel.org, ajones@ventanamicro.com, 
	mchitale@ventanamicro.com, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_082649_124097_C41D9C78 
X-CRM114-Status: GOOD (  38.92  )
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

T24gV2VkLCBTZXAgMjcsIDIwMjMgYXQgODozMeKAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCAyNyBTZXAgMjAyMyAwNzo0NToyOCBQRFQg
KC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gV2VkLCBTZXAgMjcsIDIwMjMgYXQg
MDc6NTQ6NDlQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+PiBPbiBNb24sIFNlcCAyNSwg
MjAyMyBhdCA5OjA34oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToK
PiA+PiA+Cj4gPj4gPiBPbiBNb24sIFNlcCAyNSwgMjAyMyBhdCAwNDozMzoxNVBNICswMTAwLCBD
b25vciBEb29sZXkgd3JvdGU6Cj4gPj4gPiA+IE9uIE1vbiwgU2VwIDI1LCAyMDIzIGF0IDA3OjA4
OjUwUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPj4gPiA+ID4gVGhpcyBzZXJpZXMgZXh0
ZW5kcyBLVk0gUklTQy1WIHRvIGFsbG93IEd1ZXN0L1ZNIGRpc2NvdmVyIGFuZCB1c2UKPiA+PiA+
ID4gPiBjb25kaXRpb25hbCBvcGVyYXRpb25zIHJlbGF0ZWQgSVNBIGV4dGVuc2lvbnMgKG5hbWVs
eSBYVmVudGFuYUNvbmRPcHMKPiA+PiA+ID4gPiBhbmQgWmljb25kKS4KPiA+PiA+ID4gPgo+ID4+
ID4gPiA+IFRvIHRyeSB0aGVzZSBwYXRjaGVzLCB1c2UgS1ZNVE9PTCBmcm9tIHJpc2N2X3pieF96
aWNudHJfc21zdGF0ZWVuX2NvbmRvcHNfdjEKPiA+PiA+ID4gPiBicmFuY2ggYXQ6IGh0dHBzOi8v
Z2l0aHViLmNvbS9hdnBhdGVsL2t2bXRvb2wuZ2l0Cj4gPj4gPiA+ID4KPiA+PiA+ID4gPiBUaGVz
ZSBwYXRjaGVzIGFyZSBiYXNlZCB1cG9uIHRoZSBsYXRlc3QgcmlzY3Zfa3ZtX3F1ZXVlIGFuZCBj
YW4gYWxzbyBiZQo+ID4+ID4gPiA+IGZvdW5kIGluIHRoZSByaXNjdl9rdm1fY29uZG9wc192MiBi
cmFuY2ggYXQ6Cj4gPj4gPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0
Cj4gPj4gPiA+ID4KPiA+PiA+ID4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4+ID4gPiA+ICAtIFJl
YmFzZWQgdGhlIHNlcmllcyBvbiByaXNjdl9rdm1fcXVldWUKPiA+PiA+ID4gPiAgLSBTcGxpdCBQ
QVRDSDEgYW5kIFBBVENIMiBvZiB2MSBzZXJpZXMgaW50byB0d28gcGF0Y2hlcwo+ID4+ID4gPiA+
ICAtIEFkZGVkIHNlcGFyYXRlIHRlc3QgY29uZmlncyBmb3IgWFZlbnRhbmFDb25kT3BzIGFuZCBa
aWNvbmQgaW4gUEFUQ0g3Cj4gPj4gPiA+ID4gICAgb2YgdjEgc2VyaWVzLgo+ID4+ID4gPiA+Cj4g
Pj4gPiA+ID4gQW51cCBQYXRlbCAoOSk6Cj4gPj4gPiA+ID4gICBkdC1iaW5kaW5nczogcmlzY3Y6
IEFkZCBYVmVudGFuYUNvbmRPcHMgZXh0ZW5zaW9uIGVudHJ5Cj4gPj4gPiA+ID4gICBSSVNDLVY6
IERldGVjdCBYVmVudGFuYUNvbmRPcHMgZnJvbSBJU0Egc3RyaW5nCj4gPj4gPiA+ID4gICBkdC1i
aW5kaW5nczogcmlzY3Y6IEFkZCBaaWNvbmQgZXh0ZW5zaW9uIGVudHJ5Cj4gPj4gPiA+ID4gICBS
SVNDLVY6IERldGVjdCBaaWNvbmQgZnJvbSBJU0Egc3RyaW5nCj4gPj4gPiA+Cj4gPj4gPiA+IEZv
ciB0aGVzZSA0Ogo+ID4+ID4gPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4KPiA+PiA+Cj4gPj4gPiBBY3R1YWxseSwgbm93IHRoYXQgSSB0aGlu
ayBvZiBpdCwgSSdtIGdvaW5nIHRvIHRlbXBvcmFyaWx5IHVuLXJldmlldyB0aGlzLgo+ID4+ID4g
RnJvbSBwYXRjaC1hY2NlcHRhbmNlLnJzdDoKPiA+PiA+IHwgQWRkaXRpb25hbGx5LCB0aGUgUklT
Qy1WIHNwZWNpZmljYXRpb24gYWxsb3dzIGltcGxlbWVudGVycyB0byBjcmVhdGUKPiA+PiA+IHwg
dGhlaXIgb3duIGN1c3RvbSBleHRlbnNpb25zLiAgVGhlc2UgY3VzdG9tIGV4dGVuc2lvbnMgYXJl
bid0IHJlcXVpcmVkCj4gPj4gPiB8IHRvIGdvIHRocm91Z2ggYW55IHJldmlldyBvciByYXRpZmlj
YXRpb24gcHJvY2VzcyBieSB0aGUgUklTQy1WCj4gPj4gPiB8IEZvdW5kYXRpb24uICBUbyBhdm9p
ZCB0aGUgbWFpbnRlbmFuY2UgY29tcGxleGl0eSBhbmQgcG90ZW50aWFsCj4gPj4gPiB8IHBlcmZv
cm1hbmNlIGltcGFjdCBvZiBhZGRpbmcga2VybmVsIGNvZGUgZm9yIGltcGxlbWVudG9yLXNwZWNp
ZmljCj4gPj4gPiB8IFJJU0MtViBleHRlbnNpb25zLCB3ZSdsbCBvbmx5IGNvbnNpZGVyIHBhdGNo
ZXMgZm9yIGV4dGVuc2lvbnMgdGhhdCBlaXRoZXI6Cj4gPj4gPiB8Cj4gPj4gPiB8IC0gSGF2ZSBi
ZWVuIG9mZmljaWFsbHkgZnJvemVuIG9yIHJhdGlmaWVkIGJ5IHRoZSBSSVNDLVYgRm91bmRhdGlv
biwgb3IKPiA+PiA+IHwgLSBIYXZlIGJlZW4gaW1wbGVtZW50ZWQgaW4gaGFyZHdhcmUgdGhhdCBp
cyB3aWRlbHkgYXZhaWxhYmxlLCBwZXIgc3RhbmRhcmQKPiA+PiA+IHwgICBMaW51eCBwcmFjdGlj
ZS4KPiA+PiA+Cj4gPj4gPiBUaGUgeHZlbnRhbmFjb25kb3BzIGJpdHMgZG9uJ3QgcXVhbGlmeSB1
bmRlciB0aGUgZmlyc3QgZW50cnksIGFuZCBJCj4gPj4gPiBkb24ndCB0aGluayB0aGV5IHF1YWxp
ZnkgdW5kZXIgdGhlIHNlY29uZCB5ZXQuIEFtIEkgd3Jvbmc/Cj4gPj4KPiA+PiBUaGUgVmVudGFu
YSBWZXlyb24gVjEgd2FzIGFubm91bmNlZCBpbiBEZWMgMjAyMiBhdCBSSVNDLVYgc3VtbWl0Cj4g
Pj4gZm9sbG93ZWQgYnkgcHJlc3MgcmVsZWFzZXM6Cj4gPj4gaHR0cHM6Ly93d3cudmVudGFuYW1p
Y3JvLmNvbS92ZW50YW5hLWludHJvZHVjZXMtdmV5cm9uLXdvcmxkcy1maXJzdC1kYXRhLWNlbnRl
ci1jbGFzcy1yaXNjLXYtY3B1LXByb2R1Y3QtZmFtaWx5Lwo+ID4+IGh0dHBzOi8vd3d3LmVtYmVk
ZGVkLmNvbS92ZW50YW5hLXJldmVhbHMtcmlzYy12LWNwdS1jb21wdXRlLWNoaXBsZXQtZm9yLWRh
dGEtY2VudGVyLwo+ID4+IGh0dHBzOi8vd3d3LnBybmV3c3dpcmUuY29tL25ld3MtcmVsZWFzZXMv
dmVudGFuYS1pbnRyb2R1Y2VzLXZleXJvbi13b3JsZHMtZmlyc3QtZGF0YS1jZW50ZXItY2xhc3Mt
cmlzYy12LWNwdS1wcm9kdWN0LWZhbWlseS0zMDE3MDA5ODUuaHRtbAo+ID4+Cj4gPj4gQFBhbG1l
ciBpZiB0aGUgYWJvdmUgbG9va3MgZ29vZCB0byB5b3UgdGhlbiBwbGVhc2UgYWNrIFBBVENIMS10
by00Cj4gPgo+ID4gVGhlc2UgYXJlIGFubm91bmNlbWVudHMgQUZBSUNUICYgbm90IGFuIGluZGlj
YXRpb24gb2YgImJlaW5nIGltcGxlbWVudGVkCj4gPiBpbiBoYXJkd2FyZSB0aGF0IGlzIHdpZGVs
eSBhdmFpbGFibGUiLgo+Cj4gVGhlIHNlY29uZCB0d28gbG9vayB0byBqdXN0IGJlIG5ld3MgYXJ0
aWNsZXMgcXVvdGluZyB0aGUgZmlyc3Qgd2l0aG91dAo+IGFueSByZWFsIG5ldyBpbmZvcm1hdGlv
biwgYXQgbGVhc3QganVzdCBmcm9tIHNraW1taW5nIHRoZW0gLS0gc29ycnkgaWYgSQo+IG1pc3Nl
ZCBzb21ldGhpbmcsIHRob3VnaC4KPgo+IFRoZSBhcnRpY2xlIHNheXMgIlNESyByZWxlYXNlZCB3
aXRoIG5lY2Vzc2FyeSBzb2Z0d2FyZSBhbHJlYWR5IHBvcnRlZCB0bwo+IFZleXJvbiIgYW5kICJW
ZXlyb24gVjEgRGV2ZWxvcG1lbnQgUGxhdGZvcm0gYXZhaWxhYmxlIiwgYnV0IGFzaWRlIGZyb20K
PiBxdW90ZXMgb2YgdGhlIHByZXNzIHJlbGVhc2UgSSBjYW4ndCBmaW5kIGluZm9ybWF0aW9uIG9u
IGVpdGhlciBvZiB0aG9zZQo+IChvciBhbnl0aGluZyBWVDEgcmVsYXRlZCwgYXMgdGhlcmUgd2Vy
ZSBzb21lIG5hbWluZyBhbWJpZ3VpdGllcykuCj4KPiBBbnVwIHNhaWQgZHVyaW5nIHRoZSBjYWxs
IHRoYXQgdGhleSdyZSBzdGlsbCBicmluZ2luZyB1cCB0aGUgY2hpcCBhbmQKPiBoYXZlbid0IHN0
YXJ0ZWQgc2FtcGxpbmcgeWV0LCB3aGljaCB1c3VhbGx5IG1lYW5zIHRoaW5ncyBhcmUgZmFyIGZy
b20KPiBwdWJsaWNseSBhdmFpbGlhYmxlLiAgSSB0aG91Z2h0IEkgaGVhcmQgaGltIHNheSB0aGF0
IHRoZXNlIHByZXNzCj4gcmVsZWFzZXMgd291bGQgc2F5IHRoZSBjaGlwIGlzIHNhbXBsaW5nIDJI
MjMsIGJ1dCBJIGNhbid0IGZpbmQgYW55dGhpbmcKPiBpbiB0aGVtIGFib3V0IHNhbXBsaW5nLgo+
Cj4gQW51cCBhbHNvIHNhaWQgaXQncyBhdmFpbGlhYmxlIGFzIElQIGFuZCBJIHJlbWVtYmVyIHNv
bWV0aGluZyBhdCBIb3QKPiBDaGlwcyB0YWxraW5nIGFib3V0IGFuIGV4YW1wbGUgcGxhY2UgYW5k
IHJvdXRlIGZvciBhIFZUMSwgd2hpY2ggYWxzbwo+IHNvdW5kcyB2ZXJ5IG11Y2ggbGlrZSBhIGNo
aXAgdGhhdCdzIG5vdCBhdmFpbGlhYmxlIHlldCAtLSB1c3VhbGx5IGlmCj4gdGhlcmUncyBhIGNo
aXAgZm9sa3MgYXJlIGEgbG90IG1vcmUgY29uY3JldGUgYWJvdXQgdGhhdCBzb3J0IG9mIHRoaW5n
Lgo+Cj4gU28gaXMgdGhlcmUgeW91IGNhbiBwb2ludCB0byBhYm91dCB0aGlzIGNoaXAgYWN0dWFs
bHkgYmVpbmcgcHVibGljbHkKPiBhdmFpbGlhYmxlPwoKVGhlIFZleXJvbiBWMSBjaGlwbGV0IHNh
bXBsZXMgYXJlIG5vdCBhdmFpbGFibGUgcHVibGljbHkgYXQgdGhlCm1vbWVudC4gQmVpbmcgYXZh
aWxhYmxlIGFzIGFuIElQIGlzIG5vdCB0aGUgc2FtZSBhcyBjaGlwbGV0CnNhbXBsZXMgYmVpbmcg
YXZhaWxhYmxlLgoKSWYgdGhpcyBkb2VzIG5vdCBzYXRpc2Z5IHBhdGNoIGFjY2VwdGFuY2UgY3Jp
dGVyaWEgdGhlbiBJIHdpbGwKZGVmZXIvZHJvcCB0aGUgWFZlbnRhbmFDb25kT3BzIHJlbGF0ZWQg
cGF0Y2hlcyBmb3Igbm93LgoKQ2FuIHlvdSBhY2sgUEFUQ0gyIGFuZCBQQVRDSDMgd2hpY2ggZGVh
bHMgd2l0aCBaaWNvbmQgPwoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=

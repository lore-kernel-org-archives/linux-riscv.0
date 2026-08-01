Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0D2C5516F
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32o3qOg0UXwZyMBt3Q5L4SBzSLmimSYrnkGmL+To8L8=; b=L060AF3YDswpPm
	TtPkFdCf+kAcuvesTmKKgO4+7sHJKDYH1rx6zIJPFvQojjN2YyUdkvGU4Y0zCf6xhGgpir+TWOMsA
	QrjCYytuIK7Gv7P4HcvnjgpM956IcsyNwihRnq6Kd1HWtK3Zy2B6EoKSK7RdhMTTv0PdJ0ztgvUSH
	jcTDWzi/0LGcB5T94YVEs4rPVny0ZjBz0mlqkhbBKQIYvR9IpLVrRm+AeGjD6ozLnTo4BCqrjEaG/
	K9FWqJxEz07QIpRgQ0H+tO2OjF654lJ/xfkcMkfjcdMbsTbi6DCV6A5XbNVnAQRsgZeUfsdOWnNVj
	7SeUFDoTekT6Vpfdt9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Be-0000000E3S9-2ifj;
	Sat, 01 Aug 2026 08:35:18 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Bc-0000000E3R3-17g2
	for linux-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 08:35:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47640541585so1325779f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Aug 2026 01:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785573314; cv=none;
        d=google.com; s=arc-20260327;
        b=bfq3hHb0kkbbu9PAbynufrz7LpmKLFJUk0DnjQZq1C1NBEE/C1nMH5AGoAZpI/l9Q8
         yvTYwWHmlMlaGUZFI7joa7GzL5kA8ZpJaru/pkjxgVH+S20LaCDYyfN/xmHDAC7taVd2
         kcaE1ejfUGUkjGat/O62u8mzQV3MzMF+Z7ck3Z1YosMZzSYFx3rYFy9acgOf2fGdntst
         EiNbzb05wOdN6PiXKn0HJpr/3QGgGXaiVqD9Ap/6NJgdLoaQruGSG7EahDArdNgb2j56
         N3w2Iw/TAvYljLBUhNpjxarLg/TAbABBPvjhxs32bzLT50/cDIBDowrBhJ9/zdzHx/ai
         NB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pjXyNG4M1zJXOBT1pnPYT12PCibopv8OC4ryVZx/p+M=;
        fh=65aprsm6lqjXImrypzwJJweFlASOfVnO9UCMxsuurTo=;
        b=qFVs3FG6MgzvVFHlOTO8gq/c5t/B/l8R2RujJ/zLeLCKP5Low/kYlnzFgoHm5PBAcr
         8cImU1c+8UVcZKweQsw03XUUJ2mCFy8X8Jn5PBJYoArxCt4y810mEN+XtFKQJ64wFqjj
         22fDHwM3/cHLlA/xxMYhvoL3HrMQ2FdWAlWIa6eD1/9e+UFfopFxcJ0SEfgk+h2OGhbr
         N30h51dkB8rVAbOVsEadBDwB5cTm4tXTTaT/0Ksj7tHp0pcVsvTdwYJz41eB9MrsAz0F
         /3BFyjyMWw6UrwNXCRwFGSdRaXMnWdAhL+i6lSj8DdST5xpyrZvrMVd5Hp1nQskOFG/K
         Z5Dg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785573314; x=1786178114; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjXyNG4M1zJXOBT1pnPYT12PCibopv8OC4ryVZx/p+M=;
        b=PeBjkeeNYcshlSU1yl55GtoBgYXOJ/y56ebJcN5qZVMZM6PdYSDTU1CWp+AVrGeODC
         ran1kB0J8dZACHR5wecQ7cnkW2bPvhKfd+h+TKso0FlrTqwkzalvgnf547BZxm4DChwI
         QjwYOcIc98vq2RelDE2BYGYCKj+3cOI4uqdPSmtjFNFMIDZ18lqsPER1K94FZwBzaJIQ
         JYZceip6dZGz7kjM88ztmzTd48+GcvdAMAs3nK8Lf0tF4NnDZo739uHNFd6jhC5sOz+2
         sIJp28kjohWGbvEoUkpnvSSfNTTitZjOnIMBimux9EgRzrkPUmCA6pZL1TosLAQjqPTr
         oObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785573314; x=1786178114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjXyNG4M1zJXOBT1pnPYT12PCibopv8OC4ryVZx/p+M=;
        b=iVhvmgMDMNCKw1dzdHFDeljauei4lUpxrJ+pAoBJ96RwS4jw/vlVD0bcGRYahBHrhm
         7WNpxXWKOfGYuNzmqeRuFQVJ+sHIK0GA1amsY1ZXJH24HoY5BQ0OutBZddk5wIHWx62r
         5u8I6TKnuGjEQjJmrRNl468Rhq+gip1vgzNv9flpHd55QuJf35Dmo9o2hbA9pOYaoZP/
         yMzeufnlFgz7PF7sqxV4+zpxkB42FixoDZRcj0HqS4jjRqwV0LXbgSdpQCV7Q8oMMGBj
         pwZLMY0brSUJmQN/7uDPuPkOIJbRyshNIgzclldWrxWqtkmQm47lz3QxCMD6H3utntBw
         SEVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnStBI8ZaqVusOifKI7zc9AiGTYvr3BIW2JSYBwc75gCui0nglCqj85Q/N39VED/sUKd+6oeP5k9P6Sw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSm0vTwctIX6vVYIj9k6cs7XH6cCHUXMeSrVTIFslcJl+YK5TY
	wPVG9vpSSJpV5xNrjxR60aJQhC7LGVAnYW+CBUS02MJ2HNC/iQP4TyMYTDEj6ami58ca8NlOHDn
	DdnASyEy/S50P/122ceNfqchbWhsGQtRF+iO4lUTReA==
X-Gm-Gg: AR+sD106on48OCyfaIYqqRJvsZ4ESt/APziye9asE6dWitA1VdLH2E/2yiJZ4FFAqLg
	5Brbgyjy/HUs5z9DQwKmHA0YaHFBsOYnXqDUZDEkEW1PMHz0cdSrwfd93YDV8kWWsKKSMISplxZ
	Jk1sFs8y12CozJ7bbmKQR13SBJPeK+nIvLkPXtiNbiEXSQR8K5nj41jg+8iR97MHBn1bkEHG1to
	yHQe4MKVVQBloLWUwT1GelCbd5mvQmQlCeyCtOQcaPFkCjNhg0WN3L9CNESh79KskkeIG+O0yHb
	1zgsUrvP6gXRY7ovl5W3v40sNJ6zmhZwmxmtrHwW7D6VVgSNUh+AzS0nokMTfFkQvMVZ4V/PaEv
	kkzAsOVsO+ugsK+7MFxGCaXCRGHXMFK0XsKtEzbVXjUewdCyM8ILWGn3N+LfgTUFi
X-Received: by 2002:adf:f504:0:b0:47f:6e23:64d6 with SMTP id
 ffacd0b85a97d-47fd72b070bmr5048569f8f.16.1785573314037; Sat, 01 Aug 2026
 01:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260731093833.1551341-1-wang.yechao255@zte.com.cn> <20260731093833.1551341-2-wang.yechao255@zte.com.cn>
In-Reply-To: <20260731093833.1551341-2-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 14:05:02 +0530
X-Gm-Features: AUfX_mzbsVBnjZ3iyM-h0AGkXdQtsU_1jaxbI5xdNw7bsmFJ-QMjnUZ7jmAm6zw
Message-ID: <CAAhSdy1QwcYv_Dz0s5P_9RjRegJsJQz8fjiskGNmYYFXGOnB2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Separate req and fallback_req masks
 in make_xfence_request
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_013516_359385_638AD4C2 
X-CRM114-Status: GOOD (  20.93  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMzoxMuKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IFdoZW4gaGFuZGxpbmcgaGZlbmNlIHJlcXVlc3Rz
IGluIG1ha2VfeGZlbmNlX3JlcXVlc3QoKSwgdGhlIGN1cnJlbnQgY29kZQo+IHVzZXMgYSBzaW5n
bGUgJ2FjdHVhbF9yZXEnIHZhcmlhYmxlIGFuZCBhIHNpbmdsZSB2Y3B1X21hc2suIElmIGFueSBW
Q1BVCj4gZmFpbHMgdG8gZW5xdWV1ZSB0aGUgaGZlbmNlIGRhdGEgKGJlY2F1c2UgaXRzIHF1ZXVl
IGlzIGZ1bGwpLCB0aGUgcmVxdWVzdAo+IGZhbGxzIGJhY2sgdG8gJ2ZhbGxiYWNrX3JlcScgZm9y
IGFsbCBWQ1BVcywgZXZlbiBpZiBvdGhlciBWQ1BVcyBzdGlsbAo+IGhhdmUgYXZhaWxhYmxlIHF1
ZXVlIHNwYWNlLgo+Cj4gVGhpcyBjYW4gY2F1c2UgdW5uZWNlc3NhcnkgZmFsbGJhY2sgZm9yIGhl
YWx0aHkgVkNQVXMsIGFuZCBtb3JlIHNlcmlvdXNseSwKPiB0aG9zZSBoZWFsdGh5IFZDUFVzIHdp
bGwgbm90IHByb2Nlc3MgdGhlaXIgYWxyZWFkeS1lbnF1ZXVlZCBoZmVuY2UKPiByZXF1ZXN0cyBi
ZWNhdXNlIG5vICdyZXEnIGlzIHNldCBmb3IgdGhlbS4gQXMgYSByZXN1bHQsIHRoZWlyIHF1ZXVl
cyB3aWxsCj4gcXVpY2tseSBiZWNvbWUgZnVsbCBhcyB3ZWxsLCBkZWdyYWRpbmcgcGVyZm9ybWFu
Y2UgZm9yIFNNUCBndWVzdHMuCj4KPiBGaXggdGhpcyBieSBtYWludGFpbmluZyB0d28gc2VwYXJh
dGUgYml0bWFwczogb25lIGZvciBWQ1BVcyB0aGF0Cj4gc3VjY2Vzc2Z1bGx5IGVucXVldWVkIHRo
ZSBoZmVuY2UgZGF0YSAocmVxX3ZjcHVfbWFzaykgYW5kIGFub3RoZXIgZm9yCj4gdGhvc2UgdGhh
dCBmYWlsZWQgKGZhbGxiYWNrX3JlcV92Y3B1X21hc2spLiBUaGVuIHNlbmQgdGhlIGFwcHJvcHJp
YXRlCj4gcmVxdWVzdHMgdG8gZWFjaCBncm91cC4gVGhpcyBlbnN1cmVzIHRoYXQgZmFsbGJhY2sg
aXMgb25seSBhcHBsaWVkIHRvCj4gVkNQVXMgdGhhdCBhY3R1YWxseSBuZWVkIGl0LCBwcmVzZXJ2
aW5nIHRoZSBlZmZpY2llbmN5IG9mIHRoZSBub3JtYWwKPiBwYXRoIGZvciBvdGhlcnMuCj4KPiBG
aXhlczogMTNhY2ZlYzJkYmNjICgiUklTQy1WOiBLVk06IEFkZCByZW1vdGUgSEZFTkNFIGZ1bmN0
aW9ucyBiYXNlZCBvbiBWQ1BVIHJlcXVlc3RzIikKPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFllY2hh
byA8d2FuZy55ZWNoYW8yNTVAenRlLmNvbS5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9y
aXNjdi9rdm0vdGxiLmMgfCAyMCArKysrKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS90bGIuYyBiL2FyY2gvcmlzY3Yva3ZtL3RsYi5jCj4gaW5kZXggOTkzYjI1ZWE5
NGQ2Ny4uYzU0NTIyZGVjYWE2NCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS90bGIuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3RsYi5jCj4gQEAgLTMzMiwxMCArMzMyLDExIEBAIHN0YXRp
YyB2b2lkIG1ha2VfeGZlbmNlX3JlcXVlc3Qoc3RydWN0IGt2bSAqa3ZtLAo+ICB7Cj4gICAgICAg
ICB1bnNpZ25lZCBsb25nIGk7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHU7Cj4gLSAg
ICAgICB1bnNpZ25lZCBpbnQgYWN0dWFsX3JlcSA9IHJlcTsKPiAtICAgICAgIERFQ0xBUkVfQklU
TUFQKHZjcHVfbWFzaywgS1ZNX01BWF9WQ1BVUyk7Cj4gKyAgICAgICBERUNMQVJFX0JJVE1BUChy
ZXFfdmNwdV9tYXNrLCBLVk1fTUFYX1ZDUFVTKTsKPiArICAgICAgIERFQ0xBUkVfQklUTUFQKGZh
bGxiYWNrX3JlcV92Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+Cj4gLSAgICAgICBiaXRtYXBf
emVybyh2Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+ICsgICAgICAgYml0bWFwX3plcm8ocmVx
X3ZjcHVfbWFzaywgS1ZNX01BWF9WQ1BVUyk7Cj4gKyAgICAgICBiaXRtYXBfemVybyhmYWxsYmFj
a19yZXFfdmNwdV9tYXNrLCBLVk1fTUFYX1ZDUFVTKTsKPiAgICAgICAgIGt2bV9mb3JfZWFjaF92
Y3B1KGksIHZjcHUsIGt2bSkgewo+ICAgICAgICAgICAgICAgICBpZiAoaGJhc2UgIT0gLTFVTCkg
ewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh2Y3B1LT52Y3B1X2lkIDwgaGJhc2UgfHwK
PiBAQCAtMzQ1LDEwICszNDYsMTAgQEAgc3RhdGljIHZvaWQgbWFrZV94ZmVuY2VfcmVxdWVzdChz
dHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiAgICAgICAgICAgICAgICAgfQo+Cj4gLSAgICAgICAgICAgICAgIGJpdG1hcF9zZXQodmNw
dV9tYXNrLCBpLCAxKTsKPiAtCj4gLSAgICAgICAgICAgICAgIGlmICghZGF0YSB8fCAhZGF0YS0+
dHlwZSkKPiArICAgICAgICAgICAgICAgaWYgKCFkYXRhIHx8ICFkYXRhLT50eXBlKSB7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYml0bWFwX3NldChyZXFfdmNwdV9tYXNrLCBpLCAxKTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICAgICAgICAgfQo+Cj4g
ICAgICAgICAgICAgICAgIC8qCj4gICAgICAgICAgICAgICAgICAqIEVucXVldWUgaGZlbmNlIGRh
dGEgdG8gVkNQVSBoZmVuY2UgcXVldWUuIElmIHdlIGRvbid0Cj4gQEAgLTM1NiwxMCArMzU3LDEz
IEBAIHN0YXRpYyB2b2lkIG1ha2VfeGZlbmNlX3JlcXVlc3Qoc3RydWN0IGt2bSAqa3ZtLAo+ICAg
ICAgICAgICAgICAgICAgKiBhIG1vcmUgY29uc2VydmF0aXZlIGhmZW5jZSByZXF1ZXN0Lgo+ICAg
ICAgICAgICAgICAgICAgKi8KPiAgICAgICAgICAgICAgICAgaWYgKCF2Y3B1X2hmZW5jZV9lbnF1
ZXVlKHZjcHUsIGRhdGEpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGFjdHVhbF9yZXEgPSBm
YWxsYmFja19yZXE7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYml0bWFwX3NldChmYWxsYmFj
a19yZXFfdmNwdV9tYXNrLCBpLCAxKTsKPiArICAgICAgICAgICAgICAgZWxzZQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGJpdG1hcF9zZXQocmVxX3ZjcHVfbWFzaywgaSwgMSk7Cj4gICAgICAg
ICB9Cj4KPiAtICAgICAgIGt2bV9tYWtlX3ZjcHVzX3JlcXVlc3RfbWFzayhrdm0sIGFjdHVhbF9y
ZXEsIHZjcHVfbWFzayk7Cj4gKyAgICAgICBrdm1fbWFrZV92Y3B1c19yZXF1ZXN0X21hc2soa3Zt
LCByZXEsIHJlcV92Y3B1X21hc2spOwo+ICsgICAgICAga3ZtX21ha2VfdmNwdXNfcmVxdWVzdF9t
YXNrKGt2bSwgZmFsbGJhY2tfcmVxLCBmYWxsYmFja19yZXFfdmNwdV9tYXNrKTsKPiAgfQo+Cj4g
IHZvaWQga3ZtX3Jpc2N2X2ZlbmNlX2koc3RydWN0IGt2bSAqa3ZtLAo+IC0tCj4gMi4zOS4zCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

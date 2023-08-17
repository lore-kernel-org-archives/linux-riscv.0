Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E73BC3DA66
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 17:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tInAXNW8vcI4ivqxZAGGf2otvoN0kN4vMiWbe6KysXM=; b=SNQWqI8kDQJgMPnvFjmCkdsANU
	wkApbKjbHCbZ0uoN1QHVgobCOg6DG5MybFFOPizQb/OBAxhFuiNOqWqH4ZZ1omUSEU8wPGx72gHNR
	v7SC730UBTNv3mGDinrHHYA//11lnSpqJYG6KMqy1kpmBMCXg8/IkjvH7Ig9TX87fDLkdR9zFXXki
	NymWPfUtc1ohvLuEiIAqg6WWmbcvO6l9nT5b0JKvFR8d3/dyXWNxzTNinVNLxXI/3gb5vzEc50JTq
	UXnRiUZuiF+dLly3xCijWYjiMIimu1V3jcaYzvpo5eKJzb9LR3z8lL0C6Vfq7du4XyQPcnkssnAOE
	7Sarrxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWhAb-006vIM-2q;
	Thu, 17 Aug 2023 17:52:29 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWhAX-006vGU-0Q
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 17:52:27 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-56546b45f30so74724a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1692294743; x=1692899543;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zd60Bn/5JBDDf1PePrTmr3XNCyuBtOqz/7iIY4IJ/Ow=;
        b=wK3ghD89+IBr/mkkaYVoiWCNGzzzcY01ySvztEZtt5+ObZX8U4qS4cQq091AQ70y5U
         4/ueIPt6xEci+dA+eA75VNVXQq3Y9lxsVjl0epnefgyxlrcc5x9wE/Max3YKEDNNppce
         V++/xv7cnCJOXGBmfrqW+itKiQMACHOyePNVdtfdZ2gM3hnoQq2no/cExu02Bx+035FW
         Zm+b7RdwQpdJ/gxzY4kxVIj3jbldzdZH1ynKjP2beMvCmFyxo1u6wcC/bv56hrRHAxf4
         Wm4XgrgqskCP8Fg1SSMQfBW8ek66Ycn20wh3sMhZw119ihI8GxJOg4nz+SRpz4+BV3d5
         imWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692294743; x=1692899543;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zd60Bn/5JBDDf1PePrTmr3XNCyuBtOqz/7iIY4IJ/Ow=;
        b=dTcwQMmCskHxOzSztqeghAloxKPKp94rulMJiAX9R1QFJZRS8NaNaMKFc+vqjbFJKb
         iQ2XuccpONLbVjhTTCb/ixmbL4rhlcEjXJAzb5Jw59vwPoWHtjj++nbyKyEzLNQFwP97
         8gcGQGtMZIxEnHq3DwDGot3iHfax+7dpLgflESem7A3eNdw/Htx43a2cBfFOnUnmmgoe
         GN9BaeNZuQOh9vKDgCHxlnjmXhtz7vDz/1uIqS2cU3LRTS/DsMAW0sQF0c8bQlVTdmMn
         njIEJiV3H6yjUNhII53hsB0vYsTPxtj+vb733+MDjq3lBv/cTdxAmKDK9JvTwKiEASKD
         6DvA==
X-Gm-Message-State: AOJu0YxIBmfA0XsZtKOO5dRpo52iJg4ikPwWsDdF0qPkcvIAJ+zgJb5f
	phG4ZJ5+0htLSroYlOh1+ZAqdQ==
X-Google-Smtp-Source: AGHT+IHPap/kvoZVf0w/bUJ4sSEjuyPBqEP/zyddNY09QjyyV3I66pXydHQJn4DZ/DEBwFQdByVQ3Q==
X-Received: by 2002:a17:90b:38c4:b0:26d:227c:9068 with SMTP id nn4-20020a17090b38c400b0026d227c9068mr137111pjb.16.1692294743196;
        Thu, 17 Aug 2023 10:52:23 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id h5-20020a17090a648500b0026971450601sm83767pjj.7.2023.08.17.10.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 10:52:22 -0700 (PDT)
Date: Thu, 17 Aug 2023 10:52:22 -0700 (PDT)
X-Google-Original-Date: Thu, 17 Aug 2023 10:52:21 PDT (-0700)
Subject: Re: [PATCH 00/10] RISC-V: Refactor instructions
In-Reply-To: <ZN5OJO/xOWUjLK2w@ghost>
CC: jrtc27@jrtc27.com, ajones@ventanamicro.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, bpf@vger.kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, peterz@infradead.org, jpoimboe@kernel.org,
  jbaron@akamai.com, rostedt@goodmis.org, Ard Biesheuvel <ardb@kernel.org>, anup@brainfault.org,
  atishp@atishpatra.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
  song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
  haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org, luke.r.nels@gmail.com, xi.wang@gmail.com,
  namcaov@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <mhng-7d609dde-ad47-42ed-a47b-6206e719020a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_105225_196368_EE0E7BF9 
X-CRM114-Status: GOOD (  43.29  )
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

T24gVGh1LCAxNyBBdWcgMjAyMyAwOTo0MzoxNiBQRFQgKC0wNzAwKSwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIFRodSwgQXVnIDE3LCAyMDIzIGF0IDA1OjA1OjQ1QU0gKzAxMDAsIEplc3Np
Y2EgQ2xhcmtlIHdyb3RlOgo+PiBPbiAxNyBBdWcgMjAyMywgYXQgMDQ6NTcsIEplc3NpY2EgQ2xh
cmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBPbiAxNyBBdWcgMjAyMywg
YXQgMDE6MzEsIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+
PiA+Pgo+PiA+PiBPbiBGcmksIEF1ZyAwNCwgMjAyMyBhdCAxMDoyNDozM0FNIC0wNzAwLCBDaGFy
bGllIEplbmtpbnMgd3JvdGU6Cj4+ID4+PiBPbiBGcmksIEF1ZyAwNCwgMjAyMyBhdCAxMjoyODoy
OFBNICswMzAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+ID4+Pj4gT24gVGh1LCBBdWcgMDMsIDIw
MjMgYXQgMDc6MTA6MjVQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+PiA+Pj4+PiBU
aGVyZSBhcmUgbnVtZXJvdXMgc3lzdGVtcyBpbiB0aGUga2VybmVsIHRoYXQgcmVseSBvbiBkaXJl
Y3RseQo+PiA+Pj4+PiBtb2RpZnlpbmcsIGNyZWF0aW5nLCBhbmQgcmVhZGluZyBpbnN0cnVjdGlv
bnMuIE1hbnkgb2YgdGhlc2Ugc3lzdGVtcwo+PiA+Pj4+PiBoYXZlIHJld3JpdHRlbiBjb2RlIHRv
IGRvIHRoaXMuIFRoaXMgcGF0Y2ggd2lsbCBkZWxlZ2F0ZSBhbGwgaW5zdHJ1Y3Rpb24KPj4gPj4+
Pj4gaGFuZGxpbmcgaW50byBpbnNuLmggYW5kIHJlZy5oLiBBbGwgb2YgdGhlIGNvbXByZXNzZWQg
aW5zdHJ1Y3Rpb25zLCBSVkksCj4+ID4+Pj4+IFppY3NyLCBNLCBBIGluc3RydWN0aW9ucyBhcmUg
aW5jbHVkZWQsIGFzIHdlbGwgYXMgYSBzdWJzZXQgb2YgdGhlIEYsRCxRCj4+ID4+Pj4+IGV4dGVu
c2lvbnMuCj4+ID4+Pj4+Cj4+ID4+Pj4+IC0tLQo+PiA+Pj4+PiBUaGlzIGlzIG1vZGlmeWluZyBj
b2RlIHRoYXQgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDczMTE4MzkyNS4xNTIx
NDUtMS1uYW1jYW92QGdtYWlsLmNvbS8KPj4gPj4+Pj4gaXMgYWxzbyB0b3VjaGluZy4KPj4gPj4+
Pj4KPj4gPj4+Pj4gLS0tCj4+ID4+Pj4+IFRlc3Rpbmc6Cj4+ID4+Pj4+Cj4+ID4+Pj4+IFRoZXJl
IGFyZSBhIGxvdCBvZiBzdWJzeXN0ZW1zIHRvdWNoZWQgYW5kIEkgaGF2ZSBub3QgdGVzdGVkIGV2
ZXJ5Cj4+ID4+Pj4+IGluZGl2aWR1YWwgaW5zdHJ1Y3Rpb24uIEkgZGlkIGEgbG90IG9mIGNvcHkt
cGFzdGluZyBmcm9tIHRoZSBSSVNDLVYgc3BlYwo+PiA+Pj4+PiBzbyBvcGNvZGVzIGFuZCBzdWNo
IHNob3VsZCBiZSBjb3JyZWN0Cj4+ID4+Pj4KPj4gPj4+PiBIb3cgYWJvdXQgd2UgY3JlYXRlIG1h
Y3JvcyB3aGljaCBnZW5lcmF0ZSBlYWNoIG9mIHRoZSBmdW5jdGlvbnMgYW4KPj4gPj4+PiBpbnN0
cnVjdGlvbiBuZWVkcywgZS5nLiByaXNjdl9pbnNuX2lzXyooKSwgZXRjLiBiYXNlZCBvbiB0aGUg
b3V0cHV0IG9mCj4+ID4+Pj4gWzFdLiBJIGtub3cgYmFzaWNhbGx5IG5vdGhpbmcgYWJvdXQgdGhh
dCBwcm9qZWN0LCBidXQgaXQgbG9va3MgbGlrZSBpdAo+PiA+Pj4+IGNyZWF0ZXMgbW9zdCB0aGUg
ZGVmaW5lcyB0aGlzIHNlcmllcyBpcyBjcmVhdGluZyBmcm9tIHdoYXQgd2UgW2hvcGVdIHRvCj4+
ID4+Pj4gYmUgYW4gYXV0aG9yaXRhdGl2ZSBzb3VyY2UuIEkgYWxzbyBhc3N1bWUgdGhhdCBpZiB3
ZSBkb24ndCBsaWtlIHRoZQo+PiA+Pj4+IGN1cnJlbnQgb3V0cHV0IGZvcm1hdCwgdGhlbiB3ZSBj
b3VsZCBwcm9iYWJseSBwb3N0IHBhdGNoZXMgdG8gdGhlIHByb2plY3QKPj4gPj4+PiB0byBnZXQg
dGhlIGZvcm1hdCB3ZSB3YW50LiBGb3IgZXhhbXBsZSwgd2UgY291bGQgbWF5YmUgcHJvcG9zZSBh
biAibGMiCj4+ID4+Pj4gZm9ybWF0IGZvciAiTGludXggQyIuCj4+ID4+PiBUaGF0J3MgYSBncmVh
dCBpZGVhLCBJIGRpZG4ndCByZWFsaXplIHRoYXQgZXhpc3RlZCEKPj4gPj4gSSBoYXZlIGRpc2Nv
dmVyZWQgdGhhdCB0aGUgcmlzY3Ytb3Bjb2RlcyByZXBvc2l0b3J5IGlzIG5vdCBpbiBhIHN0YXRl
Cj4+ID4+IHRoYXQgbWFrZXMgaXQgaGVscGZ1bC4gSWYgaXQgd2VyZSB3b3JrYWJsZSwgaXQgd291
bGQgbWFrZSBpdCBlYXN5IHRvCj4+ID4+IGluY2x1ZGUgYSAiTGludXggQyIgZm9ybWF0LiBJIGhh
dmUgaGFkIGEgcHVsbCByZXF1ZXN0IG9wZW4gb24gdGhlIHJlcG8KPj4gPj4gZm9yIHR3byB3ZWVr
cyBub3cgYW5kIHRoZSBwZXJzb24gd2hvIG1haW50YWlucyB0aGUgcmVwbyBoYXMgbm90Cj4+ID4+
IGludGVyYWN0ZWQuCj4+ID4KPj4gPiBIdWg/IEFuZHJldyBoYXMgcmVwbGllZCB0byB5b3UgdHdp
Y2Ugb24geW91ciBQUiwgYW5kIHdhcyB0aGUgbGFzdCBvbmUgdG8KPj4gPiBjb21tZW50LiBUaGF0
4oCZcyBoYXJkbHkg4oCcaGFzIG5vdCBpbnRlcmFjdGVk4oCdLgo+PiA+Cj4gSSBzaG91bGQgaGF2
ZSBiZWVuIG1vcmUgY2xlYXIgYmVjYXVzZSBBbmRyZXcgd2FzIHZlcnkgcmVzcG9uc2l2ZS4KPiBI
b3dldmVyLCBOZWVsIEdhbGEgYXBwZWFycyB0byBiZSB0aGUgIm1haW50YWluZXIiIGluIHRoZSBz
ZW5zZSB0aGF0Cj4gQW5kcmV3IGRlZmVycyB3aGF0IGdldHMgbWVyZ2VkIGludG8gdGhlIHJlcG8g
dG8gaGltLiBOZWVsIGhhcyBub3QKPiBwcm92aWRlZCBhbnkgZmVlZGJhY2ssIGFuZCBoZSBuZWVk
cyB0byBjb21tZW50IGJlZm9yZSBBbmRyZXcgd2lsbCBtZXJnZQo+IGFueXRoaW5nIGluLgo+PiA+
PiBBdCBtaW5pbXVtLCBpbiBvcmRlciBmb3IgaXQgdG8gYmUgdXNlZnVsIGl0IHdvdWxkIG5lZWQg
YW4gYWJpbGl0eSB0bwo+PiA+PiBkZXNjcmliZSB0aGUgYml0IG9yZGVyIG9mIGltbWVkaWF0ZXMg
aW4gYW4gaW5zdHJ1Y3Rpb24gYW5kIGluY2x1ZGUgc2NyaXB0Cj4+ID4+IGFyZ3VtZW50cyB0byBz
ZWxlY3Qgd2hpY2ggaW5zdHJ1Y3Rpb25zIHNob3VsZCBiZSBpbmNsdWRlZC4gVGhlcmUgaXMgYQo+
PiA+PiAiQyIgZm9ybWF0LCBidXQgaXQgaXMgYWN0dWFsbHkganVzdCBhIFNwaWtlIGZvcm1hdC4K
Pj4gPgo+PiA+IFNvIGV4dGVuZCBpdD8gT3IgZG8gc29tZXRoaW5nIHdpdGggUUVNVeKAmXMgZXF1
aXZhbGVudCB0aGF0IGV4cHJlc3NlcyBpdC4KPiBZZXMsIHRoYXQgaXMgYSBwb3NzaWJpbGl0eS4g
VG8gbXkga25vd2xlZGdlIEdDQyBhbmQgdGhlIHNwZWMgZ2VuZXJhdG9yCj4gaGF2ZSBtb3ZlZCBh
d2F5IGZyb20gdXNpbmcgdGhpcyByZXBvLiBJcyBpdCBzdGlsbCB1c2VkIGJ5IFFFTVU/Cj4+Cj4+
IE5vdGUgdGhhdCBldmVyeSBmaWVsZCBhbHJlYWR5IGlkZW50aWZpZXMgdGhlIGJpdCBvcmRlciAo
b3IsIGZvciB0aGUKPj4gY2FzZSBvZiBjb21wcmVzc2VkIGluc3RydWN0aW9ucywgcmVnaXN0ZXIg
cmVzdHJpY3Rpb25zKSBzaW5jZSB0aGF04oCZcwo+PiBuZWVkZWQgdG8gcHJvZHVjZSB0aGUgb2xk
IExhVGVYIGluc3RydWN0aW9uIHNldCBsaXN0aW5nczsgdGhhdOKAmXMgd2h5Cj4+IHRoZXJl4oCZ
cyBqaW1tMjAgdnMgaW1tMjAsIGZvciBleGFtcGxlLiBPbmUgY291bGQgc3VyZWx5IGVuY29kZSB0
aGF0IGluCj4+IFB5dGhvbiBhbmQgZ2VuZXJhdGUgdGhlIExhVGVYIHN0cmluZ3MgZnJvbSB0aGUg
UHl0aG9uLCBtYWtpbmcgdGhlCj4+IGRldGFpbHMgb2YgdGhlIGVuY29kaW5ncyBhdmFpbGFibGUg
ZWxzZXdoZXJlLiBPciBqdXN0IGhhdmUgeW91ciBvd24KPj4gbWFwcGluZyBmcm9tIG5hbWUgdG8g
d2hhdGV2ZXIgeW91IG5lZWQuIEJ1dCwgZWl0aGVyIHdheSwgdGhlCj4+IGluZm9ybWF0aW9uIHNo
b3VsZCBhbGwgYmUgdGhlcmUgdG9kYXkgaW4gdGhlIGlucHV0IGZpbGVzLCBpdOKAmXMganVzdCBh
Cj4+IG1hdHRlciBvZiBleHRlbmRpbmcgdGhlIHNjcmlwdCB0byBwcm9kdWNlIHdoYXRldmVyIHlv
dSB3YW50IGZyb20gdGhlbS4KPiBBbGwgb2YgdGhlIExhVGVYIGJpdCBvcmRlcnMgd2VyZSBoYXJk
Y29kZWQgaW4gc3RyaW5ncy4gQXMgc3VjaCwgdGhlIGJpdAo+IG9yZGVyIGlzIGRlc2NyaWJlZCBm
b3IgdGhlIExhVGVYIGZvcm1hdCBidXQgbm90IGluIGdlbmVyYWwuIEl0IHdvdWxkIG5vdAo+IG1h
a2Ugc2Vuc2UgdG8gaGFyZGNvZGUgdGhlbSBhIHNlY29uZCB0aW1lIGZvciB0aGUgb3V0cHV0IG9m
IHRoZSBMaW51eAo+IGdlbmVyYXRpb24uIFlvdSBjYW4gc2VlIHRoZSBzdHJpbmdzIGJ5IHNlYXJj
aGluZyBmb3IgJ2xhdGV4X21hcHBpbmcnIGluCj4gdGhlIGNvbnN0YW50cy5weSBmaWxlLgo+Cj4g
SXQgc2VlbXMgdG8gbWUgdGhhdCBpdCB3aWxsIGJlIHNpZ25pZmljYW50bHkgbW9yZSBjaGFsbGVu
Z2luZyB0byB1c2UKPiByaXNjdi1vcGNvZGVzIHRoYW4gaXQgd291bGQgZm9yIHBlb3BsZSB0byBq
dXN0IGhhbmQgY3JlYXRlIHRoZSBtYWNyb3MKPiB0aGF0IHRoZXkgbmVlZC4KCllhLCByaXNjdi1v
cGNvZGVzIGlzIHByZXR0eSBjdXN0eS4gIFdlIHN0b3BwZWQgdXNpbmcgaXQgZWxzZXdoZXJlIGFn
ZXMgCmFnby4KCj4gLSBDaGFybGllCj4+Cj4+ID4gSmVzcwo+PiA+Cj4+ID4+IE5vbmV0aGVsZXNz
LCBpdAo+PiA+PiBzZWVtcyBsaWtlIGl0IGlzIHByb2hpYml0aXZlIHRvIHVzZSBpdC4KPj4gPj4+
Pgo+PiA+Pj4+IEknZCBhbHNvIHJlY29tbWVuZCBvbmx5IGltcG9ydGluZyB0aGUgZ2VuZXJhdGVk
IGRlZmluZXMgYW5kIGdlbmVyYXRpbmcKPj4gPj4+PiB0aGUgZnVuY3Rpb25zIHRoYXQgd2lsbCBh
Y3R1YWxseSBoYXZlIGltbWVkaWF0ZSBjb25zdW1lcnMgb3IgYXJlIHBhcnQgb2YKPj4gPj4+PiBh
IHNldCBvZiBkZWZpbmVzIHRoYXQgaGF2ZSBpbW1lZGlhdGUgY29uc3VtZXJzLiBFYWNoIGNvbnN1
bWVyIG9mIG5ldwo+PiA+Pj4+IGluc3RydWN0aW9ucyB3aWxsIGJlIHJlc3BvbnNpYmxlIGZvciBn
ZW5lcmF0aW5nIGFuZCBpbXBvcnRpbmcgdGhlIGRlZmluZXMKPj4gPj4+PiBhbmQgYWRkaW5nIHRo
ZSByZXNwZWN0aXZlIG1hY3JvIGludm9jYXRpb25zIHRvIGdlbmVyYXRlIHRoZSBmdW5jdGlvbnMu
Cj4+ID4+Pj4gVGhpcyBzZXJpZXMgY2FuIGFsc28gdGFrZSB0aGF0IGFwcHJvYWNoLCBpLmUuIGNv
bnZlcnQgb25lIHNldCBvZgo+PiA+Pj4+IGluc3RydWN0aW9ucyBhdCBhIHRpbWUsIGVhY2ggaW4g
YSBzZXBhcmF0ZSBwYXRjaC4KPj4gPj4+IFNpbmNlIEkgd2FzIGhhbmQtd3JpdGluZyBldmVyeXRo
aW5nIGFuZCBjb3B5aW5nIGl0IHdhc24ndCB0b28gbXVjaAo+PiA+Pj4gZWZmb3J0IHRvIGp1c3Qg
Y29weSBhbGwgb2YgdGhlIGluc3RydWN0aW9ucyBmcm9tIGEgZ3JvdXAuIEhvd2V2ZXIsIGZyb20K
Pj4gPj4+IGEgdGVzdGluZyBzdGFuZHBvaW50IGl0IG1ha2VzIHNlbnNlIHRvIGV4Y2x1ZGUgaW5z
dHJ1Y3Rpb25zIG5vdCB5ZXQgaW4KPj4gPj4+IHVzZS4KPj4gPj4+Pgo+PiA+Pj4+IFsxXSBodHRw
czovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Ytb3Bjb2Rlcwo+PiA+Pj4+Cj4+ID4+Pj4gVGhhbmtz
LAo+PiA+Pj4+IGRyZXcKPj4gPj4+Pgo+PiA+Pj4+Cj4+ID4+Pj4+ICwgYnV0IHRoZSBjb25zdHJ1
Y3Rpb24gb2YgZXZlcnkKPj4gPj4+Pj4gaW5zdHJ1Y3Rpb24gaXMgbm90IGZ1bGx5IHRlc3RlZC4K
Pj4gPj4+Pj4KPj4gPj4+Pj4gdmVjdG9yOiBDb21waWxlZCBhbmQgYm9vdGVkCj4+ID4+Pj4+Cj4+
ID4+Pj4+IGp1bXBfbGFiZWw6IEVuc3VyZWQgc3RhdGljIGtleXMgZnVuY3Rpb24gYXMgZXhwZWN0
ZWQuCj4+ID4+Pj4+Cj4+ID4+Pj4+IGtnZGI6IEF0dGVtcHRlZCB0byBydW4gdGhlIHByb3ZpZGVk
IHRlc3RzIGJ1dCB0aGV5IGZhaWxlZCBldmVuIHdpdGhvdXQKPj4gPj4+Pj4gbXkgY2hhbmdlcwo+
PiA+Pj4+Pgo+PiA+Pj4+PiBtb2R1bGU6IExvYWRlZCBhbmQgdW5sb2FkZWQgbW9kdWxlcwo+PiA+
Pj4+Pgo+PiA+Pj4+PiBwYXRjaC5jOiBFbnN1cmVkIGtlcm5lbCBib290ZWQKPj4gPj4+Pj4KPj4g
Pj4+Pj4ga3Byb2JlczogVXNlZCBhIGtwcm9iaW5nIG1vZHVsZSB0byBwcm9iZSBqYWxyLCBhdWlw
YywgYW5kIGJyYW5jaAo+PiA+Pj4+PiBpbnN0cnVjdGlvbnMKPj4gPj4+Pj4KPj4gPj4+Pj4gbm9t
bXUgbWlzYWxpZ25lZCBhZGRyZXNzZXM6IEtlcm5lbCBib290cwo+PiA+Pj4+Pgo+PiA+Pj4+PiBr
dm06IFJhbiBLVk0gc2VsZnRlc3RzCj4+ID4+Pj4+Cj4+ID4+Pj4+IGJwZjogS2VybmVsIGJvb3Rz
LiBNb3N0IG9mIHRoZSBpbnN0cnVjdGlvbnMgYXJlIGV4Y2x1c2l2ZWx5IHVzZWQgYnkgQlBGCj4+
ID4+Pj4+IGJ1dCBJIGFtIHVuc3VyZSBvZiB0aGUgYmVzdCB3YXkgb2YgdGVzdGluZyBCUEYuCj4+
ID4+Pj4+Cj4+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUBy
aXZvc2luYy5jb20+Cj4+ID4+Pj4+Cj4+ID4+Pj4+IC0tLQo+PiA+Pj4+PiBDaGFybGllIEplbmtp
bnMgKDEwKToKPj4gPj4+Pj4gICAgIFJJU0MtVjogRXhwYW5kIGluc3RydWN0aW9uIGRlZmluaXRp
b25zCj4+ID4+Pj4+ICAgICBSSVNDLVY6IHZlY3RvcjogUmVmYWN0b3IgaW5zdHJ1Y3Rpb25zCj4+
ID4+Pj4+ICAgICBSSVNDLVY6IFJlZmFjdG9yIGp1bXAgbGFiZWwgaW5zdHJ1Y3Rpb25zCj4+ID4+
Pj4+ICAgICBSSVNDLVY6IEtHREI6IFJlZmFjdG9yIGluc3RydWN0aW9ucwo+PiA+Pj4+PiAgICAg
UklTQy1WOiBtb2R1bGU6IFJlZmFjdG9yIGluc3RydWN0aW9ucwo+PiA+Pj4+PiAgICAgUklTQy1W
OiBSZWZhY3RvciBwYXRjaCBpbnN0cnVjdGlvbnMKPj4gPj4+Pj4gICAgIFJJU0MtVjogbm9tbXU6
IFJlZmFjdG9yIGluc3RydWN0aW9ucwo+PiA+Pj4+PiAgICAgUklTQy1WOiBrdm06IFJlZmFjdG9y
IGluc3RydWN0aW9ucwo+PiA+Pj4+PiAgICAgUklTQy1WOiBicGY6IFJlZmFjdG9yIGluc3RydWN0
aW9ucwo+PiA+Pj4+PiAgICAgUklTQy1WOiBSZWZhY3RvciBidWcgYW5kIHRyYXBzIGluc3RydWN0
aW9ucwo+PiA+Pj4+Pgo+PiA+Pj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2J1Zy5oICAgICAg
ICAgICAgIHwgICAxOCArLQo+PiA+Pj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaCAg
ICAgICAgICAgIHwgMjc0NCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPj4gPj4+Pj4g
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9yZWcuaCAgICAgICAgICAgICB8ICAgODggKwo+PiA+Pj4+
PiBhcmNoL3Jpc2N2L2tlcm5lbC9qdW1wX2xhYmVsLmMgICAgICAgICAgIHwgICAxMyArLQo+PiA+
Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMgICAgICAgICAgICAgICAgIHwgICAxMyArLQo+
PiA+Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyAgICAgICAgICAgICAgIHwgICA4MCAr
LQo+PiA+Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jICAgICAgICAgICAgICAgIHwgICAg
MyArLQo+PiA+Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jICAgICAgIHwg
ICAxMyArLQo+PiA+Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5j
IHwgIDEwMCArLQo+PiA+Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jICAg
ICAgIHwgICAgNSArLQo+PiA+Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAgICAg
ICAgICAgIHwgICAgOSArLQo+PiA+Pj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGln
bmVkLmMgICAgIHwgIDIxOCArLS0KPj4gPj4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMg
ICAgICAgICAgICAgICB8ICAgIDUgKy0KPj4gPj4+Pj4gYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNu
LmMgICAgICAgICAgICAgICB8ICAyODEgKy0tCj4+ID4+Pj4+IGFyY2gvcmlzY3YvbmV0L2JwZl9q
aXQuaCAgICAgICAgICAgICAgICAgfCAgNzA3ICstLS0tLS0tCj4+ID4+Pj4+IDE1IGZpbGVzIGNo
YW5nZWQsIDI4MjUgaW5zZXJ0aW9ucygrKSwgMTQ3MiBkZWxldGlvbnMoLSkKPj4gPj4+Pj4gLS0t
Cj4+ID4+Pj4+IGJhc2UtY29tbWl0OiA1ZDBjMjMwZjFkZThjNzUxNWI2NTY3ZDlhZmJhMWYxOTZm
YjRlMmY0Cj4+ID4+Pj4+IGNoYW5nZS1pZDogMjAyMzA4MDEtbWFzdGVyLXJlZmFjdG9yLWluc3Ry
dWN0aW9ucy12NC00MzNhYTA0MGRhMDMKPj4gPj4+Pj4gLS0KPj4gPj4+Pj4gLSBDaGFybGllCj4+
ID4+Pj4+Cj4+ID4+Pj4+Cj4+ID4+Pj4+IC0tCj4+ID4+Pj4+IGt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKPj4gPj4+Pj4ga3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gPj4+Pj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YKPj4gPj4KPj4g
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gPj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+ID4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPj4gPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo+Pgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCCFC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 05:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5AaadUoq4D5O2/r8/P+qdt2QaATu2JvyB4H0ZkOo1Q=; b=pss2+keQi1tEUI
	MMgMkSWdDg2aY9tKXqvdlZdhcwk9BEObxGGAFXlmJ6FMN+qOpDm7me8thG/EGUMspQfUUViZRL9cJ
	9imGVLagVFK/wpuqmgtpWpMCer8qaYCEqJsl7qeT+hWVOhL+f89kVwIiM8ZEO6zSqmF5K297tPl1n
	HkWdYbHuaTvFo0UNghe48OtbYoMGNSEOuRXgk1/oZ/l7fqAwDmed1rgkJydxAbAJOvKKHGShjVW+z
	xOxsqdPORaG9q9HMtmClDbBw2zLMQ5mUE4DHDUT3gWs1LLhmVQ+0lFRcTA0YrI09axX/ozEl9cu6p
	tHJEKPuODSTFHbrDJSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDeJG-00GnZK-0U;
	Thu, 14 Dec 2023 05:30:58 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDeJD-00GnXS-0H
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 05:30:56 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ceba6c4b8dso6599450b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 21:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702531849; x=1703136649; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U2O5u7uen8CfuBxQN6p1uI/+w8QJjGVYrTalXyihP4=;
        b=A5zBQ02bKIZi37LqYpYF5e57lZ5SOSmwsl82RxROAA9KAG8uge0dHEjEbi0ECHWf4L
         FjVIGU/yy7VkL8V//dRxdzORCQZZRb5fP5qHl49+wXZ8PoroE21kq9xCovKIPylKzHHM
         OO8KrtgFm7nroIr4DDtALHFtqph3Dr+d3I8BtfgIc7WWHbIraXVAZfhYgEzduwIuy6hn
         1XH+70PMpmL4f1YRlqia3K7TbRTTIyg+1FcwFU8i8ZxfAndLZyH5v6cmlq+z3KQdXHpb
         xvT/AqKj9AJxKXVx9lKr7kwKxvlae2LezW5aoU0hovn95YZxmjUuib4IGRZCRAZwcOE0
         UHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702531849; x=1703136649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9U2O5u7uen8CfuBxQN6p1uI/+w8QJjGVYrTalXyihP4=;
        b=DM0ToYl9ihHWoSL4S07gZJF/px2R8q+VP9Lcm5Do47M88IvEEibgqzhqOgLmENsJnw
         rlnX9o49H5XQwm/SLOqGWoC8HVhCiip9zJyfAkz/A0GBT10sbZ7lWiBSbm4uhalZ4PD/
         flSEbTTaTsc7W0342gLZFRawtwHm/yQAOV+Q9YOD8D5C9v6nVLOM+QCTbvw5fiqwZQiG
         aHjGxNl0QfA+ZJwfFkwNXNOpjZjE/Wf2Gp55ffEJTTPzROqQDv0mEzt/GiJIc3L5RyZi
         edNOiStrIXfW6UFHeXBRqASK29f9ciRe3s6vcZFiqCGGJrheXFwCJmSDpgBbLadPZPDp
         /nAA==
X-Gm-Message-State: AOJu0Yx4r7uIUeqJPw7CmuanJy2mR2wsCIi1O7ITkF2uWKISLhIzPDQU
	A5FMRZ7vBZWDY6Hcdov6EvWhbXfz4LcIy3EHMjrjNA==
X-Google-Smtp-Source: AGHT+IEBbgOkCwAWD6LY5cWHC+N0DvQp7kP7zN+RUWEXIv/8jCMpHr53HMsDo2v41+snZLJIzHlTeVqoeyKh/HvEf70=
X-Received: by 2002:a05:6a20:4295:b0:190:38ef:3a57 with SMTP id
 o21-20020a056a20429500b0019038ef3a57mr12754720pzj.28.1702531849046; Wed, 13
 Dec 2023 21:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 11:00:37 +0530
Message-ID: <CAAhSdy3BybeRrAyaOvpncQE81GNLyY2i+6d1_YD-2w1vSt_6pA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] RISC-V, KVM: add 'vlenb' and vector CSRs to get-reg-list
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, atishp@atishpatra.org, palmer@dabbelt.com, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_213055_124500_0AFC7000 
X-CRM114-Status: GOOD (  10.55  )
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

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCAxMToxNeKAr1BNIERhbmllbCBIZW5yaXF1ZSBCYXJib3ph
CjxkYmFyYm96YUB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gSW4gdGhpcyB2
ZXJzaW9uIHdlJ3JlIGV4cG9ydGluZyBhbGwgdmVjdG9yIHJlZ3MsIG5vdCBqdXN0IHZlY3RvciBD
U1JzLAo+IGluIGdldC1yZWctbGlzdC4gQWxsIGNoYW5nZXMgd2VyZSBkb25lIGluIHBhdGNoIDMu
Cj4KPiBObyBvdGhlciBjaGFuZ2VzIG1hZGUuCj4KPiBDaGFuZ2VzIGZyb20gdjI6Cj4gLSBwYXRj
aCAzOgo+ICAgLSBjaGVjayBudW1fdmVjdG9yX3JlZ3MoKSAhPSAwIGJlZm9yZSBjb3B5aW5nIHZl
Y3RvciByZWdzCj4gICAtIGV4cG9ydCBhbGwgMzIgdmVjdG9yIHJlZ3MgaW4gbnVtX3ZlY3Rvcl9y
ZWdzKCkgYW5kIGNvcHlfdmVjdG9yX3JlZ19pbmRpY2VzKCkKPiAgIC0gaW5pdGlhbGl6ZSAnc2l6
ZScgb3V0IG9mIHRoZSBsb29wIGluIGNvcHlfdmVjdG9yX3JlZ19pbmRpY2VzKCkKPiAtIHYyIGxp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8yMDIzMTIwNTEzNTA0MS4yMjA4MDA0LTEt
ZGJhcmJvemFAdmVudGFuYW1pY3JvLmNvbS8KPgo+IERhbmllbCBIZW5yaXF1ZSBCYXJib3phICgz
KToKPiAgIFJJU0MtVjogS1ZNOiBzZXQgJ3ZsZW5iJyBpbiBrdm1fcmlzY3ZfdmNwdV9hbGxvY192
ZWN0b3JfY29udGV4dCgpCj4gICBSSVNDLVY6IEtWTTogYWRkICd2bGVuYicgVmVjdG9yIENTUgo+
ICAgUklTQy1WOiBLVk06IGFkZCB2ZWN0b3IgQ1NScyBpbiBLVk1fR0VUX1JFR19MSVNUCgpSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkkgaGF2ZSBpbXByb3Zl
ZCBzdWJqZWN0IGFuZCBkZXNjcmlwdGlvbiBvZiBwYXRjaDMgYXQgdGltZSBvZiBtZXJnaW5nCnRo
aXMgc2VyaWVzLgoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC02LjgKClRoYW5rcywKQW51
cAoKPgo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIHwgNTUgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgfCAx
NiArKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKykKPgo+IC0t
Cj4gMi40MS4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
